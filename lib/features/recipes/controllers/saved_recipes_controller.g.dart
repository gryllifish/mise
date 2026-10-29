// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Recipes saved on this device, most recent first.

@ProviderFor(SavedRecipesController)
final savedRecipesControllerProvider = SavedRecipesControllerProvider._();

/// Recipes saved on this device, most recent first.
final class SavedRecipesControllerProvider
    extends $AsyncNotifierProvider<SavedRecipesController, List<Recipe>> {
  /// Recipes saved on this device, most recent first.
  SavedRecipesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedRecipesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedRecipesControllerHash();

  @$internal
  @override
  SavedRecipesController create() => SavedRecipesController();
}

String _$savedRecipesControllerHash() =>
    r'cd26c07ec21da3904171623f8dcb6e39324b1e11';

/// Recipes saved on this device, most recent first.

abstract class _$SavedRecipesController extends $AsyncNotifier<List<Recipe>> {
  FutureOr<List<Recipe>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Recipe>>, List<Recipe>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Recipe>>, List<Recipe>>,
              AsyncValue<List<Recipe>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Whether the recipe with [id] is saved.

@ProviderFor(isRecipeSaved)
final isRecipeSavedProvider = IsRecipeSavedFamily._();

/// Whether the recipe with [id] is saved.

final class IsRecipeSavedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the recipe with [id] is saved.
  IsRecipeSavedProvider._({
    required IsRecipeSavedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isRecipeSavedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isRecipeSavedHash();

  @override
  String toString() {
    return r'isRecipeSavedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isRecipeSaved(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsRecipeSavedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isRecipeSavedHash() => r'321a13079fa3c6ca26eafb92bac6457f6cf84b5c';

/// Whether the recipe with [id] is saved.

final class IsRecipeSavedFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  IsRecipeSavedFamily._()
    : super(
        retry: null,
        name: r'isRecipeSavedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Whether the recipe with [id] is saved.

  IsRecipeSavedProvider call(String id) =>
      IsRecipeSavedProvider._(argument: id, from: this);

  @override
  String toString() => r'isRecipeSavedProvider';
}
