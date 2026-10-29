import 'package:flutter/material.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_card.dart';
import 'package:mise/shared/widgets/rise_in.dart';
import 'package:mise/shared/widgets/skeleton_box.dart';

const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: AppSpacing.xl,
  crossAxisSpacing: AppSpacing.gridGap,
  // A square photo plus two lines of title.
  childAspectRatio: 0.74,
);

const _gridPadding = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// Two-column grid of recipe cards that rise in one after another.
class SliverRecipeGrid extends StatelessWidget {
  const SliverRecipeGrid({required this.recipes, super.key});

  /// Only the first rows are staggered; later ones scroll in already there.
  static const _maxStaggered = 6;

  final List<RecipeSummary> recipes;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: _gridPadding,
      sliver: SliverGrid.builder(
        gridDelegate: _gridDelegate,
        itemCount: recipes.length,
        itemBuilder: (context, index) => RiseIn(
          // Keyed by recipe, so a new category replays the entrance.
          key: ValueKey(recipes[index].id),
          enterDelay: AppDurations.stagger * index.clamp(0, _maxStaggered),
          child: RecipeCard(recipe: recipes[index]),
        ),
      ),
    );
  }
}

/// Placeholder cards while a grid loads.
class SliverRecipeGridSkeleton extends StatelessWidget {
  const SliverRecipeGridSkeleton({super.key});

  static const _count = 4;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: _gridPadding,
      sliver: SliverGrid.builder(
        gridDelegate: _gridDelegate,
        itemCount: _count,
        itemBuilder: (context, index) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.sm,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: SkeletonBox(radius: AppRadius.md),
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: SkeletonBox(height: AppSpacing.lg),
            ),
          ],
        ),
      ),
    );
  }
}
