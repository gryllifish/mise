import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/core/utils/formatters.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// Cut-out photos of what a cook mode step uses, with their quantities.
class StepIngredients extends StatelessWidget {
  const StepIngredients({required this.ingredients, super.key});

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    // A Wrap, not a horizontal list, so it never fights the page swipe.
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final ingredient in ingredients)
          _IngredientTile(ingredient: ingredient),
      ],
    );
  }
}

class _IngredientTile extends StatelessWidget {
  const _IngredientTile({required this.ingredient});

  static const _width = 76.0;
  static const _photoSize = 60.0;

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    final name = Formatters.capitalized(ingredient.name);

    return Semantics(
      label: '$name, ${ingredient.measure}',
      excludeSemantics: true,
      child: SizedBox(
        width: _width,
        child: Column(
          spacing: AppSpacing.xs,
          children: [
            Container(
              width: _photoSize,
              height: _photoSize,
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: AppNetworkImage(
                  url: ingredient.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              Formatters.shortMeasure(ingredient.measure),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.onPhoto,
                shadows: AppTextStyles.onPhotoShadows,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              name,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.onPhotoMuted,
                shadows: AppTextStyles.onPhotoShadows,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
