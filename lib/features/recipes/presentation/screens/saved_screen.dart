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
import 'package:mise/features/recipes/controllers/saved_recipes_controller.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/save_recipe_button.dart';
import 'package:mise/features/recipes/presentation/widgets/saved_recipe_tile.dart';
import 'package:mise/shared/widgets/app_bottom_nav.dart';
import 'package:mise/shared/widgets/error_view.dart';
import 'package:mise/shared/widgets/route_bottom_bar.dart';
import 'package:mise/shared/widgets/skeleton_box.dart';

const _horizontal = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// Second tab: recipes saved on this device, available offline.
class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  /// Removes [recipe] and offers to undo it. Returns whether it worked.
  Future<bool> _remove(
    BuildContext context,
    WidgetRef ref,
    Recipe recipe,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    messenger.hideCurrentSnackBar();
    if (!await toggleSavedRecipe(context, ref, recipe)) return false;
    messenger.showSnackBar(
      SnackBar(
        content: Text(l10n.removedFromSaved(recipe.name)),
        action: SnackBarAction(
          label: l10n.undo,
          textColor: AppColors.saffron,
          onPressed: () {
            if (context.mounted) {
              unawaited(toggleSavedRecipe(context, ref, recipe));
            }
          },
        ),
      ),
    );
    return true;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: _horizontal.copyWith(
                top: AppSpacing.xl,
                bottom: AppSpacing.xl,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.sm,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        l10n.savedTitle,
                        style: AppTextStyles.display,
                      ),
                    ),
                    Text(l10n.savedSubtitle, style: AppTextStyles.bodyMuted),
                  ],
                ),
              ),
            ),
            switch (ref.watch(savedRecipesControllerProvider)) {
              AsyncData(value: []) => const SliverFillRemaining(
                hasScrollBody: false,
                child: _EmptyState(),
              ),
              AsyncData(:final value) => SliverPadding(
                padding: _horizontal,
                sliver: SliverList.separated(
                  itemCount: value.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 1, color: AppColors.divider),
                  itemBuilder: (context, index) => SavedRecipeTile(
                    key: ValueKey(value[index].id),
                    recipe: value[index],
                    onRemove: () => _remove(context, ref, value[index]),
                  ),
                ),
              ),
              AsyncError(:final error) => SliverToBoxAdapter(
                child: ErrorView(
                  message: l10n.errorMessage(error),
                  onRetry: () => ref.invalidate(savedRecipesControllerProvider),
                ),
              ),
              _ => const _ListSkeleton(),
            },
            SliverToBoxAdapter(
              child: SizedBox(
                height: AppBottomNav.height + bottomInset + AppSpacing.xl,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RouteBottomBar(
        child: AppBottomNav(current: AppTab.saved),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  static const _iconSize = 48.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: _horizontal.copyWith(bottom: AppSpacing.xxxl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.lg,
        children: [
          const Icon(
            Icons.favorite_border_rounded,
            size: _iconSize,
            color: AppColors.tomato,
          ),
          Text(
            l10n.savedEmpty,
            style: AppTextStyles.bodyMuted,
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () => context.go(AppRoutes.discover),
            child: Text(l10n.savedEmptyAction),
          ),
        ],
      ),
    );
  }
}

class _ListSkeleton extends StatelessWidget {
  const _ListSkeleton();

  static const _rows = 3;
  static const _rowHeight = 76.0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: _horizontal,
      sliver: SliverList.list(
        children: [
          for (var i = 0; i < _rows; i++)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: SkeletonBox(height: _rowHeight, radius: AppRadius.md),
            ),
        ],
      ),
    );
  }
}
