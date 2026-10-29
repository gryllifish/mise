// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Exposes the interfaces, so tests and controllers depend on abstractions.

@ProviderFor(recipesRepository)
final recipesRepositoryProvider = RecipesRepositoryProvider._();

/// Exposes the interfaces, so tests and controllers depend on abstractions.

final class RecipesRepositoryProvider
    extends
        $FunctionalProvider<
          RecipesRepository,
          RecipesRepository,
          RecipesRepository
        >
    with $Provider<RecipesRepository> {
  /// Exposes the interfaces, so tests and controllers depend on abstractions.
  RecipesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipesRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecipesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipesRepository create(Ref ref) {
    return recipesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipesRepository>(value),
    );
  }
}

String _$recipesRepositoryHash() => r'74402dbcfeb8ec575347720f0b95ef6d4ef85a12';

@ProviderFor(savedRecipesRepository)
final savedRecipesRepositoryProvider = SavedRecipesRepositoryProvider._();

final class SavedRecipesRepositoryProvider
    extends
        $FunctionalProvider<
          SavedRecipesRepository,
          SavedRecipesRepository,
          SavedRecipesRepository
        >
    with $Provider<SavedRecipesRepository> {
  SavedRecipesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedRecipesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedRecipesRepositoryHash();

  @$internal
  @override
  $ProviderElement<SavedRecipesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavedRecipesRepository create(Ref ref) {
    return savedRecipesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavedRecipesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavedRecipesRepository>(value),
    );
  }
}

String _$savedRecipesRepositoryHash() =>
    r'044f9e855ff58141ba74c873c894fc54b50abaf9';

@ProviderFor(pantryRepository)
final pantryRepositoryProvider = PantryRepositoryProvider._();

final class PantryRepositoryProvider
    extends
        $FunctionalProvider<
          PantryRepository,
          PantryRepository,
          PantryRepository
        >
    with $Provider<PantryRepository> {
  PantryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryRepositoryHash();

  @$internal
  @override
  $ProviderElement<PantryRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PantryRepository create(Ref ref) {
    return pantryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PantryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PantryRepository>(value),
    );
  }
}

String _$pantryRepositoryHash() => r'6ece55bedf5d79bf372e5a90000e36725970b635';
