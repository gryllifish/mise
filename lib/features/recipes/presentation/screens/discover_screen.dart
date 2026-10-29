import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/l10n/failure_messages.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/controllers/discover_controller.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_grid.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_search_field.dart';
import 'package:mise/features/recipes/presentation/widgets/selection_chips.dart';
import 'package:mise/features/recipes/presentation/widgets/todays_pick_card.dart';
import 'package:mise/shared/widgets/app_bottom_nav.dart';
import 'package:mise/shared/widgets/error_view.dart';
import 'package:mise/shared/widgets/route_bottom_bar.dart';
import 'package:mise/shared/widgets/section_label.dart';
import 'package:mise/shared/widgets/skeleton_box.dart';

const _horizontal = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// First tab: today's pick, categories and search.
///
/// Typing a query replaces the pick and the category grid with results.
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      // Content scrolls under the frosted bottom bar.
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            const SliverToBoxAdapter(child: _Header()),
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.screenHorizontal,
                AppSpacing.xl,
                AppSpacing.screenHorizontal,
                AppSpacing.xl,
              ),
              sliver: SliverToBoxAdapter(child: RecipeSearchField()),
            ),
            const _DiscoverContent(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: AppBottomNav.height + bottomInset + AppSpacing.xl,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RouteBottomBar(
        child: AppBottomNav(current: AppTab.discover),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenHorizontal,
        AppSpacing.xl,
        AppSpacing.screenHorizontal,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.sm,
        children: [
          SectionLabel(l10n.discoverEyebrow),
          Semantics(
            header: true,
            child: Text(l10n.discoverTitle, style: AppTextStyles.display),
          ),
        ],
      ),
    );
  }
}

class _DiscoverContent extends ConsumerWidget {
  const _DiscoverContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearching = ref.watch(
      searchQueryControllerProvider.select((query) => query.trim().isNotEmpty),
    );
    return isSearching ? const _SearchResults() : const _Browse();
  }
}

class _SearchResults extends ConsumerWidget {
  const _SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final query = ref.watch(searchQueryControllerProvider).trim();

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: _horizontal.copyWith(bottom: AppSpacing.lg),
          sliver: SliverToBoxAdapter(
            child: SectionLabel(l10n.resultsFor(query)),
          ),
        ),
        // Keeps the previous results on screen while the next query loads.
        ref
            .watch(searchResultsProvider)
            .when(
              skipLoadingOnReload: true,
              data: (recipes) => switch (recipes) {
                null => const SliverRecipeGridSkeleton(),
                [] => SliverPadding(
                  padding: _horizontal,
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      l10n.noResults(query),
                      style: AppTextStyles.bodyMuted,
                    ),
                  ),
                ),
                _ => SliverRecipeGrid(recipes: recipes),
              },
              loading: () => const SliverRecipeGridSkeleton(),
              error: (error, _) => SliverToBoxAdapter(
                child: ErrorView(
                  message: l10n.errorMessage(error),
                  onRetry: () => ref.invalidate(searchResultsProvider),
                ),
              ),
            ),
      ],
    );
  }
}

class _Browse extends ConsumerWidget {
  const _Browse();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: _horizontal.copyWith(bottom: AppSpacing.xxl),
          sliver: SliverToBoxAdapter(
            child: ref
                .watch(todaysPickControllerProvider)
                .when(
                  data: (recipe) => TodaysPickCard(recipe: recipe),
                  loading: () => const AspectRatio(
                    aspectRatio: TodaysPickCard.aspectRatio,
                    child: SkeletonBox(radius: AppRadius.lg),
                  ),
                  error: (error, _) => ErrorView(
                    message: l10n.errorMessage(error),
                    onRetry: ref
                        .read(todaysPickControllerProvider.notifier)
                        .retry,
                  ),
                ),
          ),
        ),
        SliverPadding(
          padding: _horizontal.copyWith(bottom: AppSpacing.sm),
          sliver: const SliverToBoxAdapter(child: _BrowseModeTabs()),
        ),
        switch (ref.watch(browseModeControllerProvider)) {
          BrowseMode.categories => const _CategoryBrowse(),
          BrowseMode.cuisines => const _CuisineBrowse(),
        },
      ],
    );
  }
}

/// "Categories | Countries": what the chips below browse by.
class _BrowseModeTabs extends ConsumerWidget {
  const _BrowseModeTabs();

  static const _indicatorHeight = 2.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final current = ref.watch(browseModeControllerProvider);
    final notifier = ref.read(browseModeControllerProvider.notifier);

    return Row(
      spacing: AppSpacing.xl,
      children: [
        for (final (mode, label) in [
          (BrowseMode.categories, l10n.categories),
          (BrowseMode.cuisines, l10n.cuisines),
        ])
          Semantics(
            button: true,
            selected: mode == current,
            excludeSemantics: true,
            label: label,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => notifier.select(mode),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xs,
                  children: [
                    SectionLabel(
                      label,
                      color: mode == current
                          ? AppColors.ink
                          : AppColors.inkSubtle,
                    ),
                    AnimatedContainer(
                      duration: context.motion(AppDurations.fast),
                      height: _indicatorHeight,
                      width: mode == current ? AppSpacing.xl : 0,
                      color: AppColors.tomato,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _CategoryBrowse extends ConsumerWidget {
  const _CategoryBrowse();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChipsAndGrid(
      options: ref
          .watch(categoriesControllerProvider)
          .whenData(
            (categories) => [
              for (final category in categories)
                (value: category.name, label: category.name),
            ],
          ),
      active: ref.watch(activeCategoryProvider),
      onSelected: ref.read(selectedCategoryControllerProvider.notifier).select,
      onRetry: ref.read(categoriesControllerProvider.notifier).retry,
      grid: (category) => _CategoryGrid(category: category),
    );
  }
}

class _CuisineBrowse extends ConsumerWidget {
  const _CuisineBrowse();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _ChipsAndGrid(
      options: ref
          .watch(cuisinesControllerProvider)
          .whenData(
            (cuisines) => [
              for (final cuisine in cuisines)
                (value: cuisine.name, label: '${cuisine.flag} ${cuisine.name}'),
            ],
          ),
      active: ref.watch(activeCuisineProvider),
      onSelected: ref.read(selectedCuisineControllerProvider.notifier).select,
      onRetry: ref.read(cuisinesControllerProvider.notifier).retry,
      grid: (cuisine) => _CuisineGrid(cuisine: cuisine),
    );
  }
}

/// Chips to pick from, and the grid of the picked one.
class _ChipsAndGrid extends StatelessWidget {
  const _ChipsAndGrid({
    required this.options,
    required this.active,
    required this.onSelected,
    required this.onRetry,
    required this.grid,
  });

  final AsyncValue<List<ChipOption>> options;
  final AsyncValue<String> active;
  final ValueChanged<String> onSelected;
  final VoidCallback onRetry;
  final Widget Function(String value) grid;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: options.when(
            data: (options) => SelectionChips(
              options: options,
              selected: active.value,
              onSelected: onSelected,
            ),
            loading: () => const SizedBox(height: SelectionChips.height),
            error: (error, _) => ErrorView(
              message: context.l10n.errorMessage(error),
              onRetry: onRetry,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        switch (active) {
          AsyncData(:final value) => grid(value),
          // The chips error above already offers a retry.
          AsyncError() => const SliverToBoxAdapter(child: SizedBox.shrink()),
          _ => const SliverRecipeGridSkeleton(),
        },
      ],
    );
  }
}

class _CategoryGrid extends ConsumerWidget {
  const _CategoryGrid({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = categoryRecipesProvider(category);
    return _RecipeGrid(
      recipes: ref.watch(provider),
      onRetry: () => ref.invalidate(provider),
    );
  }
}

class _CuisineGrid extends ConsumerWidget {
  const _CuisineGrid({required this.cuisine});

  final String cuisine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = cuisineRecipesProvider(cuisine);
    return _RecipeGrid(
      recipes: ref.watch(provider),
      onRetry: () => ref.invalidate(provider),
    );
  }
}

class _RecipeGrid extends StatelessWidget {
  const _RecipeGrid({required this.recipes, required this.onRetry});

  final AsyncValue<List<RecipeSummary>> recipes;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return recipes.when(
      data: (recipes) => SliverRecipeGrid(recipes: recipes),
      loading: () => const SliverRecipeGridSkeleton(),
      error: (error, _) => SliverToBoxAdapter(
        child: ErrorView(
          message: context.l10n.errorMessage(error),
          onRetry: onRetry,
        ),
      ),
    );
  }
}
