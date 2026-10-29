// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_remote_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recipesRemoteDataSource)
final recipesRemoteDataSourceProvider = RecipesRemoteDataSourceProvider._();

final class RecipesRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RecipesRemoteDataSource,
          RecipesRemoteDataSource,
          RecipesRemoteDataSource
        >
    with $Provider<RecipesRemoteDataSource> {
  RecipesRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipesRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipesRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RecipesRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecipesRemoteDataSource create(Ref ref) {
    return recipesRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipesRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipesRemoteDataSource>(value),
    );
  }
}

String _$recipesRemoteDataSourceHash() =>
    r'9c68362bc673d1e0499cf6fb4cd6eed651f33f9e';
