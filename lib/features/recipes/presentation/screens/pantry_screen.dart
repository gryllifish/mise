import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/l10n/failure_messages.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/controllers/pantry_controller.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/presentation/widgets/pantry_add_field.dart';
import 'package:mise/features/recipes/presentation/widgets/pantry_chip.dart';
import 'package:mise/features/recipes/presentation/widgets/pantry_match_tile.dart';
import 'package:mise/shared/widgets/app_bottom_nav.dart';
import 'package:mise/shared/widgets/error_view.dart';
import 'package:mise/shared/widgets/route_bottom_bar.dart';
import 'package:mise/shared/widgets/section_label.dart';
import 'package:mise/shared/widgets/skeleton_box.dart';

const _horizontal = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// Second tab: the user lists what they have at home and gets dishes that
/// use it, ready ones first.
class PantryScreen extends ConsumerWidget {
  const PantryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final pantry = ref.watch(pantryControllerProvider);

    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                    SectionLabel(l10n.navPantry),
                    Semantics(
                      header: true,
                      child: Text(
                        l10n.pantryTitle,
                        style: AppTextStyles.display,
                      ),
                    ),
                    Text(l10n.pantrySubtitle, style: AppTextStyles.bodyMuted),
                  ],
                ),
              ),
            ),
            switch (pantry) {
              AsyncData(:final value) => _PantryContent(pantry: value),
              AsyncError(:final error) => SliverToBoxAdapter(
                child: ErrorView(
                  message: l10n.errorMessage(error),
                  onRetry: () => ref.invalidate(pantryControllerProvider),
                ),
              ),
              _ => const _MatchesSkeleton(),
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
        child: AppBottomNav(current: AppTab.pantry),
      ),
    );
  }
}

class _PantryContent extends ConsumerWidget {
  const _PantryContent({required this.pantry});

  final List<String> pantry;

  /// Runs a pantry change and explains a failure; with [undoMessage],
  /// offers to undo it.
  Future<void> _change(
    BuildContext context,
    WidgetRef ref,
    Future<void> Function(PantryController pantry) change, {
    String? undoMessage,
  }) async {
    final messenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();
    final l10n = context.l10n;
    final before = pantry;
    try {
      await change(ref.read(pantryControllerProvider.notifier));
    } on Failure catch (failure) {
      messenger.showSnackBar(SnackBar(content: Text(failure.message(l10n))));
      return;
    }
    if (undoMessage == null) return;
    messenger.showSnackBar(
      SnackBar(
        content: Text(undoMessage),
        action: SnackBarAction(
          label: l10n.undo,
          textColor: AppColors.saffron,
          onPressed: () {
            if (context.mounted) {
              unawaited(
                _change(context, ref, (pantry) => pantry.restore(before)),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final catalog = ref.watch(ingredientCatalogControllerProvider);

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: _horizontal,
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.sm,
              children: [
                PantryAddField(
                  catalog: catalog.value ?? const [],
                  pantry: pantry,
                  onAdd: (name) => unawaited(
                    _change(context, ref, (pantry) => pantry.add(name)),
                  ),
                ),
                if (catalog case AsyncError())
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.pantryCatalogError,
                          style: AppTextStyles.caption,
                        ),
                      ),
                      TextButton(
                        onPressed: ref
                            .read(ingredientCatalogControllerProvider.notifier)
                            .retry,
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
        if (pantry.isEmpty)
          SliverPadding(
            padding: _horizontal,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.md,
                children: [
                  Text(l10n.pantryEmpty, style: AppTextStyles.body),
                  SectionLabel(l10n.pantrySuggestions),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final name in pantrySuggestions)
                        PantryChip(
                          name: name,
                          imageUrl: ingredientImageUrl(name),
                          actionLabel: l10n.addIngredient(name),
                          isSuggestion: true,
                          onTap: () => unawaited(
                            _change(context, ref, (pantry) => pantry.add(name)),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        else ...[
          SliverPadding(
            padding: _horizontal,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.sm,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SectionLabel(l10n.pantryYours(pantry.length)),
                      ),
                      TextButton.icon(
                        onPressed: () => unawaited(
                          _change(
                            context,
                            ref,
                            (pantry) => pantry.clear(),
                            undoMessage: l10n.pantryCleared,
                          ),
                        ),
                        icon: const Icon(Icons.delete_sweep_outlined),
                        label: Text(l10n.pantryClear),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.tomato,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final name in pantry)
                        PantryChip(
                          name: name,
                          imageUrl: ingredientImageUrl(name),
                          actionLabel: l10n.removeIngredient(name),
                          onTap: () => unawaited(
                            _change(
                              context,
                              ref,
                              (pantry) => pantry.remove(name),
                              undoMessage: l10n.removedFromSaved(name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
          const _Matches(),
        ],
      ],
    );
  }
}

class _Matches extends ConsumerWidget {
  const _Matches();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return ref
        .watch(pantryMatchesControllerProvider)
        .when(
          // Keeps the last results while a pantry change recomputes them.
          skipLoadingOnReload: true,
          data: (matches) {
            if (matches.isEmpty) {
              return SliverPadding(
                padding: _horizontal,
                sliver: SliverToBoxAdapter(
                  child: Text(
                    l10n.pantryNoMatches,
                    style: AppTextStyles.bodyMuted,
                  ),
                ),
              );
            }
            return SliverPadding(
              padding: _horizontal,
              sliver: SliverList.list(
                children: [
                  for (final fit in PantryFit.values) ...[
                    if (matches.where((match) => match.fit == fit).toList()
                        case final group when group.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: AppSpacing.lg,
                          bottom: AppSpacing.xs,
                        ),
                        child: SectionLabel(switch (fit) {
                          PantryFit.ready => l10n.pantryReady,
                          PantryFit.almost => l10n.pantryAlmost,
                          PantryFit.idea => l10n.pantryIdeas,
                        }),
                      ),
                      for (final match in group)
                        PantryMatchTile(
                          key: ValueKey(match.recipe.id),
                          match: match,
                        ),
                    ],
                  ],
                  const SizedBox(height: AppSpacing.xl),
                  Text(l10n.pantryBasics, style: AppTextStyles.caption),
                ],
              ),
            );
          },
          loading: () => const _MatchesSkeleton(),
          error: (error, _) => SliverToBoxAdapter(
            child: ErrorView(
              message: l10n.errorMessage(error),
              onRetry: ref.read(pantryMatchesControllerProvider.notifier).retry,
            ),
          ),
        );
  }
}

class _MatchesSkeleton extends StatelessWidget {
  const _MatchesSkeleton();

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
