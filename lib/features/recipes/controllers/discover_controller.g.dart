// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// All recipe categories, for the chips on Discover.
///
/// Discover's providers are kept alive so switching tabs keeps the
/// category, the search and their results.

@ProviderFor(CategoriesController)
final categoriesControllerProvider = CategoriesControllerProvider._();

/// All recipe categories, for the chips on Discover.
///
/// Discover's providers are kept alive so switching tabs keeps the
/// category, the search and their results.
final class CategoriesControllerProvider
    extends $AsyncNotifierProvider<CategoriesController, List<RecipeCategory>> {
  /// All recipe categories, for the chips on Discover.
  ///
  /// Discover's providers are kept alive so switching tabs keeps the
  /// category, the search and their results.
  CategoriesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesControllerHash();

  @$internal
  @override
  CategoriesController create() => CategoriesController();
}

String _$categoriesControllerHash() =>
    r'819dfb7241915191e8049d2c416cb533f1f282a4';

/// All recipe categories, for the chips on Discover.
///
/// Discover's providers are kept alive so switching tabs keeps the
/// category, the search and their results.

abstract class _$CategoriesController
    extends $AsyncNotifier<List<RecipeCategory>> {
  FutureOr<List<RecipeCategory>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<RecipeCategory>>, List<RecipeCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<RecipeCategory>>,
                List<RecipeCategory>
              >,
              AsyncValue<List<RecipeCategory>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The category chip the user picked; null means "the first one".

@ProviderFor(SelectedCategoryController)
final selectedCategoryControllerProvider =
    SelectedCategoryControllerProvider._();

/// The category chip the user picked; null means "the first one".
final class SelectedCategoryControllerProvider
    extends $NotifierProvider<SelectedCategoryController, String?> {
  /// The category chip the user picked; null means "the first one".
  SelectedCategoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryControllerHash();

  @$internal
  @override
  SelectedCategoryController create() => SelectedCategoryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedCategoryControllerHash() =>
    r'2b9afc96694d1a5f0207d5fa033162273ae0b24e';

/// The category chip the user picked; null means "the first one".

abstract class _$SelectedCategoryController extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The category whose recipes Discover shows.

@ProviderFor(activeCategory)
final activeCategoryProvider = ActiveCategoryProvider._();

/// The category whose recipes Discover shows.

final class ActiveCategoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<String>,
          AsyncValue<String>,
          AsyncValue<String>
        >
    with $Provider<AsyncValue<String>> {
  /// The category whose recipes Discover shows.
  ActiveCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCategoryHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<String> create(Ref ref) {
    return activeCategory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String>>(value),
    );
  }
}

String _$activeCategoryHash() => r'94cec72a3136fe6403ca9b3fcf640c8c3ffd1e47';

@ProviderFor(BrowseModeController)
final browseModeControllerProvider = BrowseModeControllerProvider._();

final class BrowseModeControllerProvider
    extends $NotifierProvider<BrowseModeController, BrowseMode> {
  BrowseModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browseModeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browseModeControllerHash();

  @$internal
  @override
  BrowseModeController create() => BrowseModeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowseMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowseMode>(value),
    );
  }
}

String _$browseModeControllerHash() =>
    r'2d255b73956e76e3c0b217f0a668bc3fe00924fe';

abstract class _$BrowseModeController extends $Notifier<BrowseMode> {
  BrowseMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<BrowseMode, BrowseMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrowseMode, BrowseMode>,
              BrowseMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Cuisines for the chips on Discover.

@ProviderFor(CuisinesController)
final cuisinesControllerProvider = CuisinesControllerProvider._();

/// Cuisines for the chips on Discover.
final class CuisinesControllerProvider
    extends $AsyncNotifierProvider<CuisinesController, List<Cuisine>> {
  /// Cuisines for the chips on Discover.
  CuisinesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cuisinesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cuisinesControllerHash();

  @$internal
  @override
  CuisinesController create() => CuisinesController();
}

String _$cuisinesControllerHash() =>
    r'80fba03a7cc12bf92f03d61efd62868c2de2d13e';

/// Cuisines for the chips on Discover.

abstract class _$CuisinesController extends $AsyncNotifier<List<Cuisine>> {
  FutureOr<List<Cuisine>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Cuisine>>, List<Cuisine>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Cuisine>>, List<Cuisine>>,
              AsyncValue<List<Cuisine>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The cuisine chip the user picked; null means "the first one".

@ProviderFor(SelectedCuisineController)
final selectedCuisineControllerProvider = SelectedCuisineControllerProvider._();

/// The cuisine chip the user picked; null means "the first one".
final class SelectedCuisineControllerProvider
    extends $NotifierProvider<SelectedCuisineController, String?> {
  /// The cuisine chip the user picked; null means "the first one".
  SelectedCuisineControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCuisineControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCuisineControllerHash();

  @$internal
  @override
  SelectedCuisineController create() => SelectedCuisineController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedCuisineControllerHash() =>
    r'47336bbafc47719736cf2f74943c8a81b1cb2d81';

/// The cuisine chip the user picked; null means "the first one".

abstract class _$SelectedCuisineController extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The cuisine whose recipes Discover shows.

@ProviderFor(activeCuisine)
final activeCuisineProvider = ActiveCuisineProvider._();

/// The cuisine whose recipes Discover shows.

final class ActiveCuisineProvider
    extends
        $FunctionalProvider<
          AsyncValue<String>,
          AsyncValue<String>,
          AsyncValue<String>
        >
    with $Provider<AsyncValue<String>> {
  /// The cuisine whose recipes Discover shows.
  ActiveCuisineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeCuisineProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeCuisineHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<String> create(Ref ref) {
    return activeCuisine(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String>>(value),
    );
  }
}

String _$activeCuisineHash() => r'8bcdf106e350908b73b6d284b5714b6f508540c1';

/// Recipes from [cuisine], kept per cuisine like [categoryRecipes].

@ProviderFor(cuisineRecipes)
final cuisineRecipesProvider = CuisineRecipesFamily._();

/// Recipes from [cuisine], kept per cuisine like [categoryRecipes].

final class CuisineRecipesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeSummary>>,
          List<RecipeSummary>,
          FutureOr<List<RecipeSummary>>
        >
    with
        $FutureModifier<List<RecipeSummary>>,
        $FutureProvider<List<RecipeSummary>> {
  /// Recipes from [cuisine], kept per cuisine like [categoryRecipes].
  CuisineRecipesProvider._({
    required CuisineRecipesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cuisineRecipesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cuisineRecipesHash();

  @override
  String toString() {
    return r'cuisineRecipesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RecipeSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecipeSummary>> create(Ref ref) {
    final argument = this.argument as String;
    return cuisineRecipes(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CuisineRecipesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cuisineRecipesHash() => r'd12b4d078f494a3a3c0bf22eaa685fb159596a06';

/// Recipes from [cuisine], kept per cuisine like [categoryRecipes].

final class CuisineRecipesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RecipeSummary>>, String> {
  CuisineRecipesFamily._()
    : super(
        retry: null,
        name: r'cuisineRecipesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Recipes from [cuisine], kept per cuisine like [categoryRecipes].

  CuisineRecipesProvider call(String cuisine) =>
      CuisineRecipesProvider._(argument: cuisine, from: this);

  @override
  String toString() => r'cuisineRecipesProvider';
}

/// Recipes in [category]. Kept per category, so switching back is instant.

@ProviderFor(categoryRecipes)
final categoryRecipesProvider = CategoryRecipesFamily._();

/// Recipes in [category]. Kept per category, so switching back is instant.

final class CategoryRecipesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeSummary>>,
          List<RecipeSummary>,
          FutureOr<List<RecipeSummary>>
        >
    with
        $FutureModifier<List<RecipeSummary>>,
        $FutureProvider<List<RecipeSummary>> {
  /// Recipes in [category]. Kept per category, so switching back is instant.
  CategoryRecipesProvider._({
    required CategoryRecipesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categoryRecipesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryRecipesHash();

  @override
  String toString() {
    return r'categoryRecipesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RecipeSummary>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecipeSummary>> create(Ref ref) {
    final argument = this.argument as String;
    return categoryRecipes(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryRecipesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryRecipesHash() => r'a2bfcb9f231beefa5fdc1ccf1e8998ef741f7e62';

/// Recipes in [category]. Kept per category, so switching back is instant.

final class CategoryRecipesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RecipeSummary>>, String> {
  CategoryRecipesFamily._()
    : super(
        retry: null,
        name: r'categoryRecipesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Recipes in [category]. Kept per category, so switching back is instant.

  CategoryRecipesProvider call(String category) =>
      CategoryRecipesProvider._(argument: category, from: this);

  @override
  String toString() => r'categoryRecipesProvider';
}

/// One random recipe per app session, featured at the top of Discover.

@ProviderFor(TodaysPickController)
final todaysPickControllerProvider = TodaysPickControllerProvider._();

/// One random recipe per app session, featured at the top of Discover.
final class TodaysPickControllerProvider
    extends $AsyncNotifierProvider<TodaysPickController, Recipe> {
  /// One random recipe per app session, featured at the top of Discover.
  TodaysPickControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todaysPickControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todaysPickControllerHash();

  @$internal
  @override
  TodaysPickController create() => TodaysPickController();
}

String _$todaysPickControllerHash() =>
    r'f12b76fdda5b348a14f6253eaba11ea081019424';

/// One random recipe per app session, featured at the top of Discover.

abstract class _$TodaysPickController extends $AsyncNotifier<Recipe> {
  FutureOr<Recipe> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Recipe>, Recipe>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Recipe>, Recipe>,
              AsyncValue<Recipe>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Text typed in the search field.

@ProviderFor(SearchQueryController)
final searchQueryControllerProvider = SearchQueryControllerProvider._();

/// Text typed in the search field.
final class SearchQueryControllerProvider
    extends $NotifierProvider<SearchQueryController, String> {
  /// Text typed in the search field.
  SearchQueryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryControllerHash();

  @$internal
  @override
  SearchQueryController create() => SearchQueryController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryControllerHash() =>
    r'9ef9eb745b39f0255f4140f28c146ff81a509a55';

/// Text typed in the search field.

abstract class _$SearchQueryController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Search results for the current query; null while the query is blank.
///
/// Each keystroke rebuilds this provider, disposing the previous run: its
/// debounce is abandoned and an in-flight request is cancelled, so a slow
/// old response can never overwrite a newer one.

@ProviderFor(searchResults)
final searchResultsProvider = SearchResultsProvider._();

/// Search results for the current query; null while the query is blank.
///
/// Each keystroke rebuilds this provider, disposing the previous run: its
/// debounce is abandoned and an in-flight request is cancelled, so a slow
/// old response can never overwrite a newer one.

final class SearchResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeSummary>?>,
          List<RecipeSummary>?,
          FutureOr<List<RecipeSummary>?>
        >
    with
        $FutureModifier<List<RecipeSummary>?>,
        $FutureProvider<List<RecipeSummary>?> {
  /// Search results for the current query; null while the query is blank.
  ///
  /// Each keystroke rebuilds this provider, disposing the previous run: its
  /// debounce is abandoned and an in-flight request is cancelled, so a slow
  /// old response can never overwrite a newer one.
  SearchResultsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchResultsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchResultsHash();

  @$internal
  @override
  $FutureProviderElement<List<RecipeSummary>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecipeSummary>?> create(Ref ref) {
    return searchResults(ref);
  }
}

String _$searchResultsHash() => r'9da137260b7fa210c2e8b32c08ff56201cfc341e';
