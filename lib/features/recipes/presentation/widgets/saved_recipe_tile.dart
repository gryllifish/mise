import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// A saved recipe row. Swipe it to the left to remove it.
class SavedRecipeTile extends StatelessWidget {
  const SavedRecipeTile({
    required this.recipe,
    required this.onRemove,
    super.key,
  });

  static const _photoSize = 76.0;

  final Recipe recipe;

  /// Removes the recipe; resolves to whether it worked, so a failed
  /// removal slides the row back instead of leaving a gap.
  final Future<bool> Function() onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final heroTag = RecipeHeroTags.saved(recipe.id);
    final meta = recipe.meta(l10n);

    return Dismissible(
      key: ValueKey(recipe.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.tomatoSoft,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: const Icon(
          Icons.delete_outline_rounded,
          color: AppColors.tomato,
        ),
      ),
      child: Semantics(
        button: true,
        label: l10n.openRecipe(recipe.name),
        excludeSemantics: true,
        // Swiping has no screen reader equivalent, so offer an action.
        customSemanticsActions: {
          CustomSemanticsAction(label: l10n.removeSaved): () =>
              unawaited(onRemove()),
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => openRecipe(
            context,
            recipe.id,
            RecipePreview(
              heroTag: heroTag,
              name: recipe.name,
              photoUrl: recipe.thumbnailUrl,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              spacing: AppSpacing.md,
              children: [
                SizedBox.square(
                  dimension: _photoSize,
                  child: Hero(
                    tag: heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      child: AppNetworkImage(url: recipe.thumbnailUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacing.xs,
                    children: [
                      Text(
                        recipe.name,
                        style: AppTextStyles.cardTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (meta.isNotEmpty)
                        Text(meta, style: AppTextStyles.caption),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.inkSubtle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
