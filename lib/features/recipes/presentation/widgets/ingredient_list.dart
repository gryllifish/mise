import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/core/utils/formatters.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

/// Ingredients as in a cookbook: the quantity in a column on the left,
/// the ingredient beside it.
class IngredientList extends StatelessWidget {
  const IngredientList({required this.ingredients, super.key});

  static const _measureWidth = 104.0;

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    final measureStyle = AppTextStyles.label.copyWith(
      color: AppColors.tomato,
    );

    return Column(
      children: [
        for (final (index, ingredient) in ingredients.indexed) ...[
          if (index > 0) const Divider(height: 1, color: AppColors.divider),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.md,
              children: [
                SizedBox(
                  width: _measureWidth,
                  child: Text(
                    Formatters.shortMeasure(ingredient.measure),
                    style: measureStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    Formatters.capitalized(ingredient.name),
                    style: AppTextStyles.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
