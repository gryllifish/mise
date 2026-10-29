import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/shared/providers/image_loader_provider.dart';

/// A photo from the network that fills its parent: a paper-colored
/// placeholder while it loads, a fade-in, and a dish icon if it fails.
class AppNetworkImage extends ConsumerWidget {
  const AppNetworkImage({
    required this.url,
    this.placeholderUrl,
    this.semanticLabel,
    this.fit = BoxFit.cover,
    super.key,
  });

  final BoxFit fit;

  final String url;

  /// A smaller copy already in the cache, shown while [url] loads.
  final String? placeholderUrl;

  /// Describes the photo; null hides it from screen readers.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final load = ref.watch(imageLoaderProvider);
    final placeholder = switch (placeholderUrl) {
      final String url => Image(
        image: load(url),
        fit: BoxFit.cover,
        excludeFromSemantics: true,
        errorBuilder: (context, error, stackTrace) => const _Placeholder(),
      ),
      null => const _Placeholder(),
    };

    return Image(
      image: load(url),
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      semanticLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return Stack(
          fit: StackFit.expand,
          children: [
            placeholder,
            AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: context.motion(AppDurations.medium),
              curve: Curves.easeOut,
              child: child,
            ),
          ],
        );
      },
      errorBuilder: (context, error, stackTrace) =>
          const _Placeholder(showIcon: true),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({this.showIcon = false});

  final bool showIcon;

  static const _iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.chip,
      child: showIcon
          ? const Center(
              child: Icon(
                Icons.restaurant_rounded,
                color: AppColors.inkSubtle,
                size: _iconSize,
              ),
            )
          : const SizedBox.expand(),
    );
  }
}
