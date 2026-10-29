import 'package:flutter/material.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// Large photo card featuring one random recipe, text over a scrim.
class TodaysPickCard extends StatelessWidget {
  const TodaysPickCard({required this.recipe, super.key});

  static const double aspectRatio = 4 / 3;

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final heroTag = RecipeHeroTags.pick(recipe.id);
    final onPhoto = AppTextStyles.caption.copyWith(color: AppColors.onPhoto);

    return Semantics(
      button: true,
      label: l10n.openRecipe(recipe.name),
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () => openRecipe(
          context,
          recipe.id,
          RecipePreview(
            heroTag: heroTag,
            name: recipe.name,
            photoUrl: recipe.imageUrl,
          ),
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: heroTag,
                  child: AppNetworkImage(url: recipe.imageUrl),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Starts above the text, so light photos stay legible.
                      begin: Alignment(0, -0.2),
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, AppColors.photoScrim],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSpacing.xs,
                    children: [
                      Text(
                        l10n.todaysPick.toUpperCase(),
                        style: AppTextStyles.eyebrow.copyWith(
                          color: AppColors.saffron,
                        ),
                      ),
                      Text(
                        recipe.name,
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.onPhoto,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (recipe.meta(l10n) case final meta
                          when meta.isNotEmpty)
                        Text(meta, style: onPhoto),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
