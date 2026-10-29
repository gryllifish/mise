import 'package:flutter/material.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// A recipe found from the pantry: what it uses and what is missing.
class PantryMatchTile extends StatelessWidget {
  const PantryMatchTile({required this.match, super.key});

  static const _photoSize = 76.0;

  final PantryMatch match;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final recipe = match.recipe;
    final heroTag = RecipeHeroTags.pantry(recipe.id);
    final missing = match.missing;

    return Semantics(
      button: true,
      label: l10n.openRecipe(recipe.name),
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
                    Text(
                      l10n.pantryUses(match.uses.length),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.olive,
                      ),
                    ),
                    if (missing != null)
                      Text(
                        missing.isEmpty
                            ? l10n.pantryHaveAll
                            : l10n.pantryMissing(
                                missing
                                    .map((ingredient) => ingredient.name)
                                    .join(', '),
                              ),
                        style: AppTextStyles.caption.copyWith(
                          color: missing.isEmpty
                              ? AppColors.olive
                              : AppColors.tomato,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
    );
  }
}
