import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_controller.g.dart';

/// One recipe, from the network or, when offline, from the saved copy.
@riverpod
class RecipeController extends _$RecipeController {
  @override
  Future<RecipeLookup> build(String id) async =>
      (await ref.watch(recipesRepositoryProvider).getRecipe(id)).getOrThrow();

  void retry() => ref.invalidateSelf();
}
