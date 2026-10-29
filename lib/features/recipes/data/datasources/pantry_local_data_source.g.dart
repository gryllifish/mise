// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantry_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The opened Hive box. `bootstrap` opens it and overrides this provider;
/// tests override it with their own box.

@ProviderFor(pantryBox)
final pantryBoxProvider = PantryBoxProvider._();

/// The opened Hive box. `bootstrap` opens it and overrides this provider;
/// tests override it with their own box.

final class PantryBoxProvider
    extends $FunctionalProvider<Box<String>, Box<String>, Box<String>>
    with $Provider<Box<String>> {
  /// The opened Hive box. `bootstrap` opens it and overrides this provider;
  /// tests override it with their own box.
  PantryBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryBoxHash();

  @$internal
  @override
  $ProviderElement<Box<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Box<String> create(Ref ref) {
    return pantryBox(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Box<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Box<String>>(value),
    );
  }
}

String _$pantryBoxHash() => r'9d46c161aeb096d11135f6bf57b78ea46e998fea';

@ProviderFor(pantryLocalDataSource)
final pantryLocalDataSourceProvider = PantryLocalDataSourceProvider._();

final class PantryLocalDataSourceProvider
    extends
        $FunctionalProvider<
          PantryLocalDataSource,
          PantryLocalDataSource,
          PantryLocalDataSource
        >
    with $Provider<PantryLocalDataSource> {
  PantryLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pantryLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pantryLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<PantryLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PantryLocalDataSource create(Ref ref) {
    return pantryLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PantryLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PantryLocalDataSource>(value),
    );
  }
}

String _$pantryLocalDataSourceHash() =>
    r'967dcf2cd4f9bbd86a9d04b38ec5c3e40d0381ce';
