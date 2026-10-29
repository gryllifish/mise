// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The opened Hive box. Opening is async, so `bootstrap` opens it and
/// overrides this provider; tests override it with their own box.

@ProviderFor(savedRecipesBox)
final savedRecipesBoxProvider = SavedRecipesBoxProvider._();

/// The opened Hive box. Opening is async, so `bootstrap` opens it and
/// overrides this provider; tests override it with their own box.

final class SavedRecipesBoxProvider
    extends $FunctionalProvider<Box<String>, Box<String>, Box<String>>
    with $Provider<Box<String>> {
  /// The opened Hive box. Opening is async, so `bootstrap` opens it and
  /// overrides this provider; tests override it with their own box.
  SavedRecipesBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedRecipesBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedRecipesBoxHash();

  @$internal
  @override
  $ProviderElement<Box<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Box<String> create(Ref ref) {
    return savedRecipesBox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Box<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Box<String>>(value),
    );
  }
}

String _$savedRecipesBoxHash() => r'1404d98766ad4b3e1d7fbb6c4fbfb37a568e147e';

@ProviderFor(savedRecipesLocalDataSource)
final savedRecipesLocalDataSourceProvider =
    SavedRecipesLocalDataSourceProvider._();

final class SavedRecipesLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SavedRecipesLocalDataSource,
          SavedRecipesLocalDataSource,
          SavedRecipesLocalDataSource
        >
    with $Provider<SavedRecipesLocalDataSource> {
  SavedRecipesLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedRecipesLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedRecipesLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SavedRecipesLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavedRecipesLocalDataSource create(Ref ref) {
    return savedRecipesLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavedRecipesLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavedRecipesLocalDataSource>(value),
    );
  }
}

String _$savedRecipesLocalDataSourceHash() =>
    r'2b1c2349b96f3cf4d9bd80ae4ebdefbb7da5a3f9';
