import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';

import '../../../helpers/pump_app.dart';

void main() {
  Future<FakePantryRepository> openPantry(
    WidgetTester tester, {
    List<String> pantry = const [],
  }) async {
    final repository = FakePantryRepository()..pantry.addAll(pantry);
    await pumpApp(tester, pantry: repository);
    await tester.tap(find.text('What I have'));
    await tester.pumpAndSettle();
    return repository;
  }

  Finder chip(String label) => find.bySemanticsLabel(label);

  testWidgets('empty, suggests popular ingredients to add', (tester) async {
    final repository = await openPantry(tester);

    expect(
      find.text('Start with two or three things you have at home.'),
      findsOneWidget,
    );

    await tester.tap(chip('Add Rice'));
    await tester.pumpAndSettle();

    expect(repository.pantry, ['Rice']);
    expect(chip('Remove Rice'), findsOneWidget);
  });

  testWidgets('typing suggests catalog ingredients to add', (tester) async {
    final repository = await openPantry(tester);

    await tester.enterText(find.byType(TextField), 'gar');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Garlic'));
    await tester.pumpAndSettle();

    expect(repository.pantry, ['Garlic']);
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.controller?.text, isEmpty, reason: 'ready for the next one');
  });

  testWidgets('groups matches by how ready the user is', (tester) async {
    await openPantry(tester, pantry: ['Rice', 'Salmon', 'Garlic']);

    expect(find.text('READY TO COOK'), findsOneWidget);
    expect(find.text('Garlic rice'), findsOneWidget);
    expect(find.text('Uses 2 of yours'), findsOneWidget);
    expect(find.text('You have everything'), findsWidgets);
  });

  testWidgets('says what is missing', (tester) async {
    await openPantry(tester, pantry: ['Rice']);

    expect(find.text('ALMOST THERE'), findsOneWidget);
    expect(find.text('Missing: Salmon'), findsWidgets);
  });

  testWidgets('tapping a match opens the recipe', (tester) async {
    await openPantry(tester, pantry: ['Rice']);

    await tester.tap(find.text('Rice bowl'));
    await tester.pumpAndSettle();

    expect(
      tester
          .widget<RecipeDetailScreen>(find.byType(RecipeDetailScreen))
          .recipeId,
      'rice-bowl',
    );
  });

  group('removing', () {
    testWidgets('tapping a chip removes it, and undo brings it back', (
      tester,
    ) async {
      final repository = await openPantry(tester, pantry: ['Rice', 'Garlic']);

      await tester.tap(chip('Remove Rice'));
      await tester.pumpAndSettle();
      expect(repository.pantry, ['Garlic']);
      expect(chip('Remove Rice'), findsNothing);

      await tester.tap(find.text('Undo'));
      await tester.pumpAndSettle();
      expect(repository.pantry, ['Rice', 'Garlic']);
    });

    testWidgets('clear all empties it, and undo restores everything', (
      tester,
    ) async {
      final repository = await openPantry(tester, pantry: ['Rice', 'Garlic']);
      expect(find.text('YOUR PANTRY · 2'), findsOneWidget);

      await tester.tap(find.text('Clear all'));
      await tester.pumpAndSettle();
      expect(repository.pantry, isEmpty);
      expect(find.text('Pantry cleared.'), findsOneWidget);

      await tester.tap(find.text('Undo'));
      await tester.pumpAndSettle();
      expect(repository.pantry, ['Rice', 'Garlic']);
    });

    testWidgets('chips are easy to hit', (tester) async {
      await openPantry(tester, pantry: ['Rice']);

      expect(
        tester.getSize(chip('Remove Rice')).height,
        greaterThanOrEqualTo(48),
      );
    });

    testWidgets('a failed save explains it and keeps the chip', (
      tester,
    ) async {
      final repository = await openPantry(tester, pantry: ['Rice']);
      repository.saveFailure = const StorageFailure();

      await tester.tap(chip('Remove Rice'));
      await tester.pumpAndSettle();

      expect(find.text("We couldn't read this recipe data."), findsOneWidget);
      expect(chip('Remove Rice'), findsOneWidget);
    });
  });

  testWidgets('offline, offers a retry that recovers', (tester) async {
    final repository = FakePantryRepository()
      ..pantry.add('Rice')
      ..searchFailure = const NoConnectionFailure();
    await pumpApp(tester, pantry: repository);
    await tester.tap(find.text('What I have'));
    await tester.pumpAndSettle();

    expect(
      find.text("You're offline. Check your connection and try again."),
      findsOneWidget,
    );

    repository.searchFailure = null;
    await tester.tap(find.text('Try again'));
    await tester.pumpAndSettle();

    expect(find.text('Rice bowl'), findsOneWidget);
  });
}
