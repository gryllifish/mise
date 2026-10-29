import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/shared/widgets/app_network_image.dart';
import 'package:mise/shared/widgets/circle_icon_button.dart';

/// Full-bleed photo at the top of the detail screen, with a back button,
/// a [trailing] action and the rounded top of the content sheet.
class RecipePhotoHeader extends StatelessWidget {
  const RecipePhotoHeader({
    required this.heroTag,
    required this.trailing,
    this.imageUrl,
    this.placeholderUrl,
    super.key,
  });

  static const _aspectRatio = 1.0;

  final String heroTag;
  final Widget trailing;

  /// Null while nothing is known about the photo yet (a deep link loading).
  final String? imageUrl;
  final String? placeholderUrl;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    return AspectRatio(
      aspectRatio: _aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: heroTag,
            child: url == null
                ? const ColoredBox(color: AppColors.chip)
                : AppNetworkImage(url: url, placeholderUrl: placeholderUrl),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip: context.l10n.back,
                    backgroundColor: AppColors.surface,
                    onPressed: context.pop,
                  ),
                  trailing,
                ],
              ),
            ),
          ),
          // The content sheet's rounded top, drawn over the photo.
          const Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            height: AppRadius.xl,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: AppRadius.sheetTop,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
