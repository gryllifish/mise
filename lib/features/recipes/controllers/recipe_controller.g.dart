// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// One recipe, from the network or, when offline, from the saved copy.

@ProviderFor(RecipeController)
final recipeControllerProvider = RecipeControllerFamily._();

/// One recipe, from the network or, when offline, from the saved copy.
final class RecipeControllerProvider
    extends $AsyncNotifierProvider<RecipeController, RecipeLookup> {
  /// One recipe, from the network or, when offline, from the saved copy.
  RecipeControllerProvider._({
    required RecipeControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'recipeControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recipeControllerHash();

  @override
  String toString() {
    return r'recipeControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecipeController create() => RecipeController();

  @override
  bool operator ==(Object other) {
    return other is RecipeControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recipeControllerHash() => r'42db4b031dff2fd8bb089a1b54ae25f54778c90b';

/// One recipe, from the network or, when offline, from the saved copy.

final class RecipeControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          RecipeController,
          AsyncValue<RecipeLookup>,
          RecipeLookup,
          FutureOr<RecipeLookup>,
          String
        > {
  RecipeControllerFamily._()
    : super(
        retry: null,
        name: r'recipeControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One recipe, from the network or, when offline, from the saved copy.

  RecipeControllerProvider call(String id) =>
      RecipeControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'recipeControllerProvider';
}

/// One recipe, from the network or, when offline, from the saved copy.

abstract class _$RecipeController extends $AsyncNotifier<RecipeLookup> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<RecipeLookup> build(String id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RecipeLookup>, RecipeLookup>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RecipeLookup>, RecipeLookup>,
              AsyncValue<RecipeLookup>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
