import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_loader_provider.g.dart';

/// Turns a photo URL into an [ImageProvider]. Tests override it to stay off
/// the network.
///
/// Mobile caches photos on disk with `cached_network_image`. The web uses a
/// plain [NetworkImage]: the browser's HTTP cache already keeps photos, and
/// the package's web cache can leave loads hanging.
@Riverpod(keepAlive: true)
ImageProvider Function(String url) imageLoader(Ref ref) =>
    kIsWeb ? NetworkImage.new : CachedNetworkImageProvider.new;
