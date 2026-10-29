import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// The dish photo filling cook mode, story style: a slow zoom (Ken Burns)
/// that drifts to a new spot of the photo on every [page], under a shade
/// that keeps the text on top readable.
///
/// TheMealDB photos are 700px, about a quarter of a phone screen's
/// height in pixels, so the photo is blurred on purpose: soft ambience
/// rather than visible pixels.
///
/// With "Reduce motion" on, the photo stays still.
class CookBackdrop extends StatefulWidget {
  const CookBackdrop({
    required this.imageUrl,
    required this.placeholderUrl,
    required this.page,
    super.key,
  });

  final String imageUrl;
  final String placeholderUrl;
  final int page;

  @override
  State<CookBackdrop> createState() => _CookBackdropState();
}

class _CookBackdropState extends State<CookBackdrop>
    with SingleTickerProviderStateMixin {
  /// Spots of the photo each step drifts to, in turn.
  static const List<Alignment> _focalPoints = [
    Alignment(-0.5, -0.4),
    Alignment(0.5, 0.3),
    Alignment(-0.3, 0.5),
    Alignment(0.4, -0.5),
    Alignment.center,
  ];
  static const _minScale = 1.08;
  static const _maxScale = 1.22;
  static const _blur = 6.0;

  late final _zoom = AnimationController(
    vsync: this,
    duration: AppDurations.kenBurns,
  );
  late final _zoomCurve = CurvedAnimation(
    parent: _zoom,
    curve: Curves.easeInOut,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) {
      _zoom.stop();
    } else if (!_zoom.isAnimating) {
      _zoom.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _zoomCurve.dispose();
    _zoom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRect(
          child: TweenAnimationBuilder<Alignment>(
            tween: AlignmentTween(
              end: _focalPoints[widget.page % _focalPoints.length],
            ),
            duration: context.motion(AppDurations.focusShift),
            curve: Curves.easeInOut,
            builder: (context, focus, child) => AnimatedBuilder(
              animation: _zoomCurve,
              builder: (context, child) => Transform.scale(
                scale: _minScale + (_maxScale - _minScale) * _zoomCurve.value,
                alignment: focus,
                child: child,
              ),
              child: child,
            ),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
              child: AppNetworkImage(
                url: widget.imageUrl,
                placeholderUrl: widget.placeholderUrl,
              ),
            ),
          ),
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.35, 1],
              colors: [
                AppColors.photoScrim,
                AppColors.photoShade,
                AppColors.photoScrim,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
