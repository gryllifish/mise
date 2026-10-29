import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// A pill with an ingredient's photo and name.
///
/// Pantry chips remove the ingredient when tapped anywhere (the ✕ says
/// so); suggestion chips add it. Both are at least 48px tall, an easy
/// target for a thumb.
class PantryChip extends StatelessWidget {
  const PantryChip({
    required this.name,
    required this.imageUrl,
    required this.actionLabel,
    required this.onTap,
    this.isSuggestion = false,
    super.key,
  });

  static const _minHeight = 48.0;
  static const _photoSize = 30.0;
  static const _iconSize = 18.0;

  final String name;
  final String imageUrl;

  /// What tapping does, for screen readers: "Remove garlic".
  final String actionLabel;
  final VoidCallback onTap;
  final bool isSuggestion;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: actionLabel,
      excludeSemantics: true,
      child: Material(
        color: isSuggestion ? Colors.transparent : AppColors.chip,
        shape: StadiumBorder(
          side: isSuggestion
              ? const BorderSide(color: AppColors.divider)
              : BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: _minHeight),
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.sm,
                right: AppSpacing.md,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: AppSpacing.sm,
                children: [
                  Container(
                    width: _photoSize,
                    height: _photoSize,
                    padding: const EdgeInsets.all(AppSpacing.xxs),
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: AppNetworkImage(
                        url: imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(name, style: AppTextStyles.chip),
                  Icon(
                    isSuggestion ? Icons.add_rounded : Icons.close_rounded,
                    size: _iconSize,
                    color: AppColors.inkMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
