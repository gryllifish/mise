import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/l10n/failure_messages.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/controllers/recipe_controller.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/ingredient_list.dart';
import 'package:mise/features/recipes/presentation/widgets/method_steps.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_photo_header.dart';
import 'package:mise/features/recipes/presentation/widgets/save_recipe_button.dart';
import 'package:mise/shared/widgets/error_view.dart';
import 'package:mise/shared/widgets/route_bottom_bar.dart';
import 'package:mise/shared/widgets/section_label.dart';
import 'package:mise/shared/widgets/skeleton_box.dart';

const _horizontal = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// Photo, ingredients and method of one recipe.
///
/// With a [preview] from the list that opened it, the photo and title show
/// at once while the rest loads.
class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({required this.recipeId, this.preview, super.key});

  final String recipeId;
  final RecipePreview? preview;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final lookup = ref.watch(recipeControllerProvider(recipeId));
    final recipe = lookup.value?.recipe;
    final name = recipe?.name ?? preview?.name;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: RecipePhotoHeader(
              heroTag: preview?.heroTag ?? RecipeHeroTags.detail(recipeId),
              imageUrl: recipe?.imageUrl ?? preview?.photoUrl,
              placeholderUrl: preview?.photoUrl ?? recipe?.thumbnailUrl,
              trailing: SaveRecipeButton(recipeId: recipeId, recipe: recipe),
            ),
          ),
          SliverPadding(
            padding: _horizontal,
            sliver: SliverToBoxAdapter(
              child: name == null
                  ? const SkeletonBox(height: AppSpacing.xxl)
                  : Semantics(
                      header: true,
                      child: Text(name, style: AppTextStyles.headline),
                    ),
            ),
          ),
          switch (lookup) {
            AsyncData(:final value) => _RecipeBody(
              recipe: value.recipe,
              isSavedCopy: value.isSavedCopy,
            ),
            AsyncError(:final error) => SliverToBoxAdapter(
              child: ErrorView(
                message: l10n.errorMessage(error),
                onRetry: ref
                    .read(recipeControllerProvider(recipeId).notifier)
                    .retry,
              ),
            ),
            _ => const _BodySkeleton(),
          },
        ],
      ),
      bottomNavigationBar: RouteBottomBar(
        enterWithPage: true,
        child: _StartCookingBar(recipe: recipe),
      ),
    );
  }
}

class _RecipeBody extends StatelessWidget {
  const _RecipeBody({required this.recipe, required this.isSavedCopy});

  final Recipe recipe;
  final bool isSavedCopy;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final meta = recipe.meta(l10n);

    return SliverPadding(
      padding: _horizontal.copyWith(
        top: AppSpacing.sm,
        bottom: AppSpacing.xxl,
      ),
      sliver: SliverList.list(
        children: [
          if (meta.isNotEmpty) Text(meta, style: AppTextStyles.bodyMuted),
          if (isSavedCopy) ...[
            const SizedBox(height: AppSpacing.lg),
            const _SavedCopyNotice(),
          ],
          const SizedBox(height: AppSpacing.xxl),
          SectionLabel(
            '${l10n.ingredients} · '
            '${l10n.ingredientCount(recipe.ingredients.length)}',
          ),
          const SizedBox(height: AppSpacing.sm),
          IngredientList(ingredients: recipe.ingredients),
          const SizedBox(height: AppSpacing.xxl),
          SectionLabel(
            '${l10n.method} · ${l10n.stepCount(recipe.steps.length)}',
          ),
          const SizedBox(height: AppSpacing.lg),
          MethodSteps(steps: recipe.steps),
        ],
      ),
    );
  }
}

/// Tells the user they're reading the copy saved on the device.
class _SavedCopyNotice extends StatelessWidget {
  const _SavedCopyNotice();

  static const _iconSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.oliveSoft,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          const Icon(
            Icons.cloud_off_rounded,
            size: _iconSize,
            color: AppColors.olive,
          ),
          Expanded(
            child: Text(
              context.l10n.savedOffline,
              style: AppTextStyles.caption.copyWith(color: AppColors.olive),
            ),
          ),
        ],
      ),
    );
  }
}

class _BodySkeleton extends StatelessWidget {
  const _BodySkeleton();

  static const _rows = 5;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: _horizontal.copyWith(top: AppSpacing.xl),
      sliver: SliverList.list(
        children: [
          for (var i = 0; i < _rows; i++)
            const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: SkeletonBox(height: AppSpacing.lg),
            ),
        ],
      ),
    );
  }
}

class _StartCookingBar extends StatelessWidget {
  const _StartCookingBar({required this.recipe});

  final Recipe? recipe;

  static const _buttonHeight = 54.0;

  @override
  Widget build(BuildContext context) {
    final recipe = this.recipe;
    final canCook = recipe != null && recipe.steps.isNotEmpty;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenHorizontal,
            vertical: AppSpacing.md,
          ),
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(_buttonHeight),
            ),
            onPressed: canCook
                ? () => unawaited(
                    context.push<void>(AppRoutes.cookPath(recipe.id)),
                  )
                : null,
            icon: const Icon(Icons.restaurant_menu_rounded),
            label: Text(context.l10n.startCooking),
          ),
        ),
      ),
    );
  }
}
