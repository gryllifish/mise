import 'dart:async';

import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_controller.g.dart';

/// All recipe categories, for the chips on Discover.
///
/// Discover's providers are kept alive so switching tabs keeps the
/// category, the search and their results.
@Riverpod(keepAlive: true)
class CategoriesController extends _$CategoriesController {
  @override
  Future<List<RecipeCategory>> build() async =>
      (await ref.watch(recipesRepositoryProvider).getCategories()).getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// The category chip the user picked; null means "the first one".
@Riverpod(keepAlive: true)
class SelectedCategoryController extends _$SelectedCategoryController {
  @override
  String? build() => null;

  void select(String category) => state = category;
}

/// The category whose recipes Discover shows.
@riverpod
AsyncValue<String> activeCategory(Ref ref) {
  final selected = ref.watch(selectedCategoryControllerProvider);
  return ref
      .watch(categoriesControllerProvider)
      .whenData((categories) => selected ?? categories.first.name);
}

/// Whether Discover browses by category or by cuisine.
enum BrowseMode { categories, cuisines }

@Riverpod(keepAlive: true)
class BrowseModeController extends _$BrowseModeController {
  @override
  BrowseMode build() => BrowseMode.categories;

  void select(BrowseMode mode) => state = mode;
}

/// Cuisines for the chips on Discover.
@Riverpod(keepAlive: true)
class CuisinesController extends _$CuisinesController {
  @override
  Future<List<Cuisine>> build() async =>
      (await ref.watch(recipesRepositoryProvider).getCuisines()).getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// The cuisine chip the user picked; null means "the first one".
@Riverpod(keepAlive: true)
class SelectedCuisineController extends _$SelectedCuisineController {
  @override
  String? build() => null;

  void select(String cuisine) => state = cuisine;
}

/// The cuisine whose recipes Discover shows.
@riverpod
AsyncValue<String> activeCuisine(Ref ref) {
  final selected = ref.watch(selectedCuisineControllerProvider);
  return ref
      .watch(cuisinesControllerProvider)
      .whenData((cuisines) => selected ?? cuisines.first.name);
}

/// Recipes from [cuisine], kept per cuisine like [categoryRecipes].
@Riverpod(keepAlive: true)
Future<List<RecipeSummary>> cuisineRecipes(Ref ref, String cuisine) async =>
    (await ref.watch(recipesRepositoryProvider).getRecipesInCuisine(cuisine))
        .getOrThrow();

/// Recipes in [category]. Kept per category, so switching back is instant.
@Riverpod(keepAlive: true)
Future<List<RecipeSummary>> categoryRecipes(Ref ref, String category) async =>
    (await ref.watch(recipesRepositoryProvider).getRecipesInCategory(category))
        .getOrThrow();

/// One random recipe per app session, featured at the top of Discover.
@Riverpod(keepAlive: true)
class TodaysPickController extends _$TodaysPickController {
  @override
  Future<Recipe> build() async =>
      (await ref.watch(recipesRepositoryProvider).getRandomRecipe())
          .getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// Text typed in the search field.
@Riverpod(keepAlive: true)
class SearchQueryController extends _$SearchQueryController {
  @override
  String build() => '';

  void search(String query) => state = query;

  void clear() => state = '';
}

/// Waits this long after the last keystroke before searching.
const searchDebounce = Duration(milliseconds: 350);

/// Search results for the current query; null while the query is blank.
///
/// Each keystroke rebuilds this provider, disposing the previous run: its
/// debounce is abandoned and an in-flight request is cancelled, so a slow
/// old response can never overwrite a newer one.
@Riverpod(keepAlive: true)
Future<List<RecipeSummary>?> searchResults(Ref ref) async {
  final query = ref.watch(searchQueryControllerProvider).trim();
  if (query.isEmpty) return null;

  final cancel = CancelSignal();
  var disposed = false;
  ref.onDispose(() {
    disposed = true;
    cancel.cancel();
  });

  await Future<void>.delayed(searchDebounce);
  if (disposed) throw StateError('Superseded by a newer search');

  return (await ref
          .read(recipesRepositoryProvider)
          .searchRecipes(query, cancel: cancel))
      .getOrThrow();
}
