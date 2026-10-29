import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/presentation/screens/discover_screen.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';
import 'package:mise/features/recipes/presentation/screens/saved_screen.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/recipe_fixtures.dart';

void main() {
  Future<FakeSavedRecipesRepository> openSaved(
    WidgetTester tester, {
    List<String> ids = const [],
  }) async {
    final saved = FakeSavedRecipesRepository()
      ..saved.addAll([for (final id in ids) buildRecipe(id: id)]);
    await pumpApp(tester, saved: saved);
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();
    return saved;
  }

  Future<void> swipeAway(WidgetTester tester, String name) async {
    await tester.drag(find.text(name), const Offset(-500, 0));
    await tester.pumpAndSettle();
  }

  testWidgets('with nothing saved, points to Discover', (tester) async {
    await openSaved(tester);

    expect(
      find.text('Recipes you save show up here, even without a connection.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Discover recipes'));
    await tester.pumpAndSettle();
    expect(find.byType(DiscoverScreen), findsOneWidget);
  });

  testWidgets('lists saved recipes in the order the repository gives', (
    tester,
  ) async {
    await openSaved(tester, ids: ['2', '1']);

    expect(
      tester.getTopLeft(find.text('Recipe 2')).dy,
      lessThan(tester.getTopLeft(find.text('Recipe 1')).dy),
    );
  });

  testWidgets('tapping a recipe opens it, and back returns here', (
    tester,
  ) async {
    await openSaved(tester, ids: ['1']);

    await tester.tap(find.text('Recipe 1'));
    await tester.pumpAndSettle();
    expect(find.byType(RecipeDetailScreen), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.byType(SavedScreen), findsOneWidget);
  });

  testWidgets('swiping removes a recipe, and undo brings it back', (
    tester,
  ) async {
    final saved = await openSaved(tester, ids: ['1', '2']);

    await swipeAway(tester, 'Recipe 1');
    expect(find.text('Recipe 1'), findsNothing);
    expect(saved.saved.map((recipe) => recipe.id), ['2']);
    expect(find.text('Removed “Recipe 1”.'), findsOneWidget);

    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(find.text('Recipe 1'), findsOneWidget);
    expect(saved.saved.map((recipe) => recipe.id), ['1', '2']);
  });

  testWidgets('a failed removal explains it and keeps the recipe', (
    tester,
  ) async {
    final saved = await openSaved(tester, ids: ['1']);
    saved.failure = const StorageFailure();

    await swipeAway(tester, 'Recipe 1');

    expect(find.text("We couldn't read this recipe data."), findsOneWidget);
    expect(find.text('Recipe 1'), findsOneWidget);
  });

  testWidgets('a recipe saved from its detail shows up here', (tester) async {
    await pumpApp(tester);
    routerOf(tester).go(AppRoutes.recipePath('9'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Save recipe'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();

    expect(find.text('Recipe 9'), findsOneWidget);
    expect(find.text('Seafood · Japanese'), findsOneWidget);
  });
}
