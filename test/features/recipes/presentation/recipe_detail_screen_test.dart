import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/presentation/screens/cook_mode_screen.dart';
import 'package:mise/features/recipes/presentation/screens/discover_screen.dart';

import '../../../helpers/pump_app.dart';

void main() {
  /// Opens recipe [id] like a deep link, without a preview.
  Future<void> openRecipe(WidgetTester tester, [String id = '7']) async {
    routerOf(tester).go(AppRoutes.recipePath(id));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the recipe with ingredients and method', (tester) async {
    await pumpApp(tester);
    await openRecipe(tester);

    expect(find.text('Recipe 7'), findsOneWidget);
    expect(find.text('Seafood · Japanese'), findsOneWidget);
    expect(find.text('INGREDIENTS · 2 INGREDIENTS'), findsOneWidget);
    // Ingredient names are capitalized; measures are kept as written, in a
    // column to the left of the name.
    expect(find.text('Rice'), findsOneWidget);
    expect(
      tester.getTopLeft(find.text('2 cups')).dx,
      lessThan(tester.getTopLeft(find.text('Rice')).dx),
    );

    await scrollTo(tester, find.text('Serve.'));
    expect(find.text('METHOD · 3 STEPS'), findsOneWidget);
    expect(find.text('01'), findsOneWidget);
  });

  testWidgets("opened from today's pick, shows its title at once", (
    tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('Salmon bowl'));
    // One frame into the transition, before the lookup resolves.
    await tester.pump();

    expect(find.text('Salmon bowl'), findsWidgets);
    await tester.pumpAndSettle();
    expect(find.byTooltip('Save recipe'), findsOneWidget);
  });

  group('save', () {
    testWidgets('the heart saves and unsaves the recipe', (tester) async {
      final saved = FakeSavedRecipesRepository();
      await pumpApp(tester, saved: saved);
      await openRecipe(tester);

      await tester.tap(find.byTooltip('Save recipe'));
      await tester.pumpAndSettle();
      expect(saved.saved.map((recipe) => recipe.id), ['7']);
      expect(find.byTooltip('Remove from saved'), findsOneWidget);

      await tester.tap(find.byTooltip('Remove from saved'));
      await tester.pumpAndSettle();
      expect(saved.saved, isEmpty);
      expect(find.byTooltip('Save recipe'), findsOneWidget);
    });

    testWidgets('a failed save explains it and rolls the heart back', (
      tester,
    ) async {
      final saved = FakeSavedRecipesRepository()
        ..failure = const StorageFailure();
      await pumpApp(tester, saved: saved);
      await openRecipe(tester);

      await tester.tap(find.byTooltip('Save recipe'));
      await tester.pumpAndSettle();

      expect(find.text("We couldn't read this recipe data."), findsOneWidget);
      expect(find.byTooltip('Save recipe'), findsOneWidget);
    });
  });

  testWidgets('offline, says it is showing the saved copy', (tester) async {
    await pumpApp(tester, recipes: FakeRecipesRepository()..isSavedCopy = true);
    await openRecipe(tester);

    expect(find.text('Showing your saved copy while offline.'), findsOneWidget);
  });

  testWidgets('a failed lookup offers a retry that recovers', (tester) async {
    final recipes = FakeRecipesRepository();
    await pumpApp(tester, recipes: recipes);
    recipes.failure = const TimeoutFailure();
    await openRecipe(tester);

    expect(find.text('This is taking too long. Please try again.'), findsOne);

    recipes.failure = null;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();

    expect(find.text('Recipe 7'), findsOneWidget);
    expect(find.text('Rice'), findsOneWidget);
  });

  testWidgets('start cooking opens cook mode', (tester) async {
    await pumpApp(tester, reduceMotion: true);
    await openRecipe(tester);

    await tester.tap(find.text('Start cooking'));
    await tester.pumpAndSettle();

    expect(
      tester.widget<CookModeScreen>(find.byType(CookModeScreen)).recipeId,
      '7',
    );
  });

  testWidgets('back returns to Discover', (tester) async {
    await pumpApp(tester);
    await openRecipe(tester);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.byType(DiscoverScreen), findsOneWidget);
  });
}
