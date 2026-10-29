import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/features/recipes/controllers/discover_controller.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';

import '../../../helpers/pump_app.dart';

void main() {
  Future<void> typeQuery(WidgetTester tester, String query) async {
    await tester.enterText(find.byType(TextField), query);
    // The provider rebuilds on the next frame; the debounce starts there.
    await tester.pump();
    await tester.pump(searchDebounce);
    await tester.pumpAndSettle();
  }

  testWidgets("shows today's pick and the first category's recipes", (
    tester,
  ) async {
    await pumpApp(tester);

    expect(find.text('Salmon bowl'), findsOneWidget);
    expect(find.text('Seafood · Japanese'), findsOneWidget);

    await scrollTo(tester, find.text('Seafood dish 3'));
    expect(find.text('Seafood dish 1'), findsOneWidget);
  });

  testWidgets('picking a category shows its recipes', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Dessert'));
    await tester.pumpAndSettle();

    await scrollTo(tester, find.text('Dessert dish 1'));
    expect(find.text('Seafood dish 1'), findsNothing);
  });

  group('countries', () {
    Future<void> showCountries(WidgetTester tester) async {
      await scrollTo(tester, find.text('COUNTRIES'));
      await tester.tap(find.text('COUNTRIES'));
      await tester.pumpAndSettle();
    }

    testWidgets("switching to countries shows the first cuisine's recipes", (
      tester,
    ) async {
      await pumpApp(tester);
      await showCountries(tester);

      expect(find.text('🇪🇸 Spanish'), findsOneWidget);
      expect(find.text('🇯🇵 Japanese'), findsOneWidget);
      expect(find.text('Seafood'), findsNothing, reason: 'category chips');
      await scrollTo(tester, find.text('Spanish plate 1'));
    });

    testWidgets('picking a country shows its recipes', (tester) async {
      await pumpApp(tester);
      await showCountries(tester);

      await tester.tap(find.text('🇯🇵 Japanese'));
      await tester.pumpAndSettle();

      await scrollTo(tester, find.text('Japanese plate 2'));
      expect(find.text('Spanish plate 1'), findsNothing);
    });

    testWidgets('the choice survives switching tabs', (tester) async {
      await pumpApp(tester);
      await showCountries(tester);

      await tester.tap(find.text('Saved'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Discover'));
      await tester.pumpAndSettle();

      await scrollTo(tester, find.text('🇪🇸 Spanish'));
      expect(find.text('🇪🇸 Spanish'), findsOneWidget);
    });
  });

  group('search', () {
    testWidgets('replaces the browse sections with results', (tester) async {
      await pumpApp(tester);

      await typeQuery(tester, 'salmon');

      expect(find.text('RESULTS FOR “SALMON”'), findsOneWidget);
      expect(find.text('Found salmon'), findsOneWidget);
      expect(find.text('Salmon bowl'), findsNothing);
    });

    testWidgets('waits for typing to pause before searching', (tester) async {
      final recipes = FakeRecipesRepository();
      await pumpApp(tester, recipes: recipes);

      await tester.enterText(find.byType(TextField), 'sal');
      await tester.pump(const Duration(milliseconds: 100));
      await tester.enterText(find.byType(TextField), 'salmon');
      await tester.pump(searchDebounce);
      await tester.pumpAndSettle();

      expect(recipes.searches, ['salmon']);
    });

    testWidgets('says so when nothing matches', (tester) async {
      await pumpApp(tester);

      await typeQuery(tester, 'nothing');

      expect(find.text('No recipes match “nothing”.'), findsOneWidget);
    });

    testWidgets('clearing it brings the browse sections back', (
      tester,
    ) async {
      await pumpApp(tester);
      await typeQuery(tester, 'salmon');

      await tester.tap(find.byTooltip('Clear search'));
      await tester.pumpAndSettle();

      expect(find.text('Salmon bowl'), findsOneWidget);
      expect(find.byTooltip('Clear search'), findsNothing);
    });

    testWidgets('survives switching tabs', (tester) async {
      await pumpApp(tester);
      await typeQuery(tester, 'salmon');

      await tester.tap(find.text('Saved'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Discover'));
      await tester.pumpAndSettle();

      expect(find.text('salmon'), findsOneWidget);
      expect(find.text('Found salmon'), findsOneWidget);
    });
  });

  testWidgets('tapping a card opens that recipe', (tester) async {
    await pumpApp(tester);
    await scrollTo(tester, find.text('Seafood dish 2'));

    await tester.tap(find.text('Seafood dish 2'));
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<RecipeDetailScreen>(find.byType(RecipeDetailScreen))
          .recipeId,
      'Seafood-2',
    );
  });

  testWidgets('offline, explains it and recovers on retry', (tester) async {
    final recipes = FakeRecipesRepository()
      ..failure = const NoConnectionFailure();
    await pumpApp(tester, recipes: recipes);

    const offline = "You're offline. Check your connection and try again.";
    // Today's pick and the categories each fail on their own.
    expect(find.text(offline), findsNWidgets(2));

    recipes.failure = null;
    for (var i = 0; i < 2; i++) {
      await tester.tap(find.text('Try again').first);
      await tester.pumpAndSettle();
    }

    expect(find.text(offline), findsNothing);
    expect(find.text('Salmon bowl'), findsOneWidget);
    await scrollTo(tester, find.text('Seafood dish 1'));
  });
}
