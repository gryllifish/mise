import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';

/// Paper-colored block standing in for content that is still loading.
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({this.height, this.radius = AppRadius.sm, super.key});

  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
