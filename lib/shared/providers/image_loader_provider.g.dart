// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_loader_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Turns a photo URL into an [ImageProvider]. Tests override it to stay off
/// the network.
///
/// Mobile caches photos on disk with `cached_network_image`. The web uses a
/// plain [NetworkImage]: the browser's HTTP cache already keeps photos, and
/// the package's web cache can leave loads hanging.

@ProviderFor(imageLoader)
final imageLoaderProvider = ImageLoaderProvider._();

/// Turns a photo URL into an [ImageProvider]. Tests override it to stay off
/// the network.
///
/// Mobile caches photos on disk with `cached_network_image`. The web uses a
/// plain [NetworkImage]: the browser's HTTP cache already keeps photos, and
/// the package's web cache can leave loads hanging.

final class ImageLoaderProvider
    extends
        $FunctionalProvider<
          ImageProvider<Object> Function(String url),
          ImageProvider<Object> Function(String url),
          ImageProvider<Object> Function(String url)
        >
    with $Provider<ImageProvider<Object> Function(String url)> {
  /// Turns a photo URL into an [ImageProvider]. Tests override it to stay off
  /// the network.
  ///
  /// Mobile caches photos on disk with `cached_network_image`. The web uses a
  /// plain [NetworkImage]: the browser's HTTP cache already keeps photos, and
  /// the package's web cache can leave loads hanging.
  ImageLoaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageLoaderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageLoaderHash();

  @$internal
  @override
  $ProviderElement<ImageProvider<Object> Function(String url)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageProvider<Object> Function(String url) create(Ref ref) {
    return imageLoader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageProvider<Object> Function(String url) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ImageProvider<Object> Function(String url)>(value),
    );
  }
}

String _$imageLoaderHash() => r'41ae97859357c2bac15a95d674720f00261ae366';
