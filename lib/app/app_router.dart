import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/presentation/screens/cook_mode_screen.dart';
import 'package:mise/features/recipes/presentation/screens/discover_screen.dart';
import 'package:mise/features/recipes/presentation/screens/pantry_screen.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';
import 'package:mise/features/recipes/presentation/screens/saved_screen.dart';
import 'package:mise/features/recipes/presentation/widgets/recipe_navigation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Lives in `app/` (not `core/`) because it imports every feature's screens;
/// `core` must never depend on features.
///
/// Every route sits on the root navigator, without a shell: a `Hero` only
/// flies between pages of the same navigator, and recipe photos fly from
/// both tabs into the detail screen.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.discover,
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const DiscoverScreen()),
        routes: [
          GoRoute(
            path: AppRoutes.recipe,
            pageBuilder: (context, state) => _fadeThroughPage(
              context,
              state,
              RecipeDetailScreen(
                recipeId: _recipeIdOf(state),
                // Lost on deep links and browser reloads; the screen copes.
                preview: switch (state.extra) {
                  final RecipePreview preview => preview,
                  _ => null,
                },
              ),
            ),
            routes: [
              GoRoute(
                path: AppRoutes.cook,
                pageBuilder: (context, state) => _fadeThroughPage(
                  context,
                  state,
                  CookModeScreen(recipeId: _recipeIdOf(state)),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.pantry,
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const PantryScreen()),
      ),
      GoRoute(
        path: AppRoutes.saved,
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const SavedScreen()),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

/// The path only matches with a non-empty id, so it is always present.
String _recipeIdOf(GoRouterState state) =>
    state.pathParameters[AppRoutes.recipeIdParam] ?? '';

/// Fade with a slight rise, so the Hero photo is the star of the transition.
///
/// With "Reduce motion" on, pages (and the Hero riding on them) switch
/// instantly.
CustomTransitionPage<void> _fadeThroughPage(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  const riseOffset = Offset(0, 0.015);

  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: context.motion(AppDurations.page),
    reverseTransitionDuration: context.motion(AppDurations.medium),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: AppCurves.emphasized,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween(begin: riseOffset, end: Offset.zero).animate(curved),
          child: child,
        ),
      );
    },
  );
}
