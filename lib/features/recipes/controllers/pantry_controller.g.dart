// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Every ingredient TheMealDB knows, loaded once per session.

@ProviderFor(IngredientCatalogController)
final ingredientCatalogControllerProvider =
    IngredientCatalogControllerProvider._();

/// Every ingredient TheMealDB knows, loaded once per session.
final class IngredientCatalogControllerProvider
    extends
        $AsyncNotifierProvider<
          IngredientCatalogController,
          List<CatalogIngredient>
        > {
  /// Every ingredient TheMealDB knows, loaded once per session.
  IngredientCatalogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ingredientCatalogControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ingredientCatalogControllerHash();

  @$internal
  @override
  IngredientCatalogController create() => IngredientCatalogController();
}

String _$ingredientCatalogControllerHash() =>
    r'9018e284681f80a774f8c2bb6e31b50c702f09b2';

/// Every ingredient TheMealDB knows, loaded once per session.

abstract class _$IngredientCatalogController
    extends $AsyncNotifier<List<CatalogIngredient>> {
  FutureOr<List<CatalogIngredient>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<CatalogIngredient>>,
              List<CatalogIngredient>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CatalogIngredient>>,
                List<CatalogIngredient>
              >,
              AsyncValue<List<CatalogIngredient>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// What the user has at home, kept on the device, in the order added.
///
/// Every change shows at once and rolls back if saving fails.

@ProviderFor(PantryController)
final pantryControllerProvider = PantryControllerProvider._();

/// What the user has at home, kept on the device, in the order added.
///
/// Every change shows at once and rolls back if saving fails.
final class PantryControllerProvider
    extends $AsyncNotifierProvider<PantryController, List<String>> {
  /// What the user has at home, kept on the device, in the order added.
  ///
  /// Every change shows at once and rolls back if saving fails.
  PantryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryControllerHash();

  @$internal
  @override
  PantryController create() => PantryController();
}

String _$pantryControllerHash() => r'f04bfa8e163feda0b40d40348bf9be264b6b0d47';

/// What the user has at home, kept on the device, in the order added.
///
/// Every change shows at once and rolls back if saving fails.

abstract class _$PantryController extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Recipes that use one catalog ingredient. Kept per ingredient, so adding
/// another to the pantry doesn't fetch the rest again.

@ProviderFor(recipesWithIngredient)
final recipesWithIngredientProvider = RecipesWithIngredientFamily._();

/// Recipes that use one catalog ingredient. Kept per ingredient, so adding
/// another to the pantry doesn't fetch the rest again.

final class RecipesWithIngredientProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecipeSummary>>,
          List<RecipeSummary>,
          FutureOr<List<RecipeSummary>>
        >
    with
        $FutureModifier<List<RecipeSummary>>,
        $FutureProvider<List<RecipeSummary>> {
  /// Recipes that use one catalog ingredient. Kept per ingredient, so adding
  /// another to the pantry doesn't fetch the rest again.
  RecipesWithIngredientProvider._({
    required RecipesWithIngredientFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipesWithIngredientProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipesWithIngredientHash();

  @override
  String toString() {
    return r'recipesWithIngredientProvider'
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
    return recipesWithIngredient(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesWithIngredientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipesWithIngredientHash() =>
    r'0a9aadd2654f99a28e77857ead0e2f8451ad8b64';

/// Recipes that use one catalog ingredient. Kept per ingredient, so adding
/// another to the pantry doesn't fetch the rest again.

final class RecipesWithIngredientFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RecipeSummary>>, String> {
  RecipesWithIngredientFamily._()
    : super(
        retry: null,
        name: r'recipesWithIngredientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Recipes that use one catalog ingredient. Kept per ingredient, so adding
  /// another to the pantry doesn't fetch the rest again.

  RecipesWithIngredientProvider call(String ingredient) =>
      RecipesWithIngredientProvider._(argument: ingredient, from: this);

  @override
  String toString() => r'recipesWithIngredientProvider';
}

/// Recipes to cook with the pantry: ready ones first, then those missing
/// little, then more ideas.
///
/// The free API filters by one ingredient at a time, so this fetches each
/// pantry ingredient (and its catalog variants) and ranks recipes by how
/// many they use.

@ProviderFor(PantryMatchesController)
final pantryMatchesControllerProvider = PantryMatchesControllerProvider._();

/// Recipes to cook with the pantry: ready ones first, then those missing
/// little, then more ideas.
///
/// The free API filters by one ingredient at a time, so this fetches each
/// pantry ingredient (and its catalog variants) and ranks recipes by how
/// many they use.
final class PantryMatchesControllerProvider
    extends $AsyncNotifierProvider<PantryMatchesController, List<PantryMatch>> {
  /// Recipes to cook with the pantry: ready ones first, then those missing
  /// little, then more ideas.
  ///
  /// The free API filters by one ingredient at a time, so this fetches each
  /// pantry ingredient (and its catalog variants) and ranks recipes by how
  /// many they use.
  PantryMatchesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryMatchesControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryMatchesControllerHash();

  @$internal
  @override
  PantryMatchesController create() => PantryMatchesController();
}

String _$pantryMatchesControllerHash() =>
    r'd2970ac35b7b4dc4e2cbb5ef0b284bca20670993';

/// Recipes to cook with the pantry: ready ones first, then those missing
/// little, then more ideas.
///
/// The free API filters by one ingredient at a time, so this fetches each
/// pantry ingredient (and its catalog variants) and ranks recipes by how
/// many they use.

abstract class _$PantryMatchesController
    extends $AsyncNotifier<List<PantryMatch>> {
  FutureOr<List<PantryMatch>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<PantryMatch>>, List<PantryMatch>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PantryMatch>>, List<PantryMatch>>,
              AsyncValue<List<PantryMatch>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
