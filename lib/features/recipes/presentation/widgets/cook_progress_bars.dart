import 'package:flutter/material.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';

/// Story-style segments over the photo, one per step, filled up to the
/// [current] one.
class CookProgressBars extends StatelessWidget {
  const CookProgressBars({
    required this.count,
    required this.current,
    super.key,
  });

  static const _height = 3.0;

  final int count;

  /// Index of the step on screen; [count] or more fills every segment.
  final int current;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Row(
        spacing: AppSpacing.xs,
        children: [
          for (var i = 0; i < count; i++)
            Expanded(
              child: AnimatedContainer(
                duration: context.motion(AppDurations.fast),
                height: _height,
                decoration: BoxDecoration(
                  color: i <= current
                      ? AppColors.onPhoto
                      : AppColors.onPhotoFaint,
                  borderRadius: AppRadius.pillBorder,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
