import 'package:flutter/material.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// Square photo with the recipe name below, for grids.
class RecipeCard extends StatelessWidget {
  const RecipeCard({required this.recipe, super.key});

  final RecipeSummary recipe;

  @override
  Widget build(BuildContext context) {
    final heroTag = RecipeHeroTags.grid(recipe.id);

    return Semantics(
      button: true,
      label: context.l10n.openRecipe(recipe.name),
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () => openRecipe(
          context,
          recipe.id,
          RecipePreview(
            heroTag: heroTag,
            name: recipe.name,
            photoUrl: recipe.thumbnailUrl,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.sm,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  child: AppNetworkImage(url: recipe.thumbnailUrl),
                ),
              ),
            ),
            Text(
              recipe.name,
              style: AppTextStyles.cardTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
