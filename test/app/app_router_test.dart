import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/presentation/screens/cook_mode_screen.dart';
import 'package:mise/features/recipes/presentation/screens/discover_screen.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';
import 'package:mise/features/recipes/presentation/screens/saved_screen.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('opens on Discover', (tester) async {
    await pumpApp(tester);

    expect(find.byType(DiscoverScreen), findsOneWidget);
  });

  testWidgets('the bottom bar switches between the tabs', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();
    expect(find.byType(SavedScreen), findsOneWidget);
    expect(find.byType(DiscoverScreen), findsNothing);

    await tester.tap(find.text('Discover'));
    await tester.pumpAndSettle();
    expect(find.byType(DiscoverScreen), findsOneWidget);
  });

  testWidgets('a deep link to cook mode backs out through the recipe', (
    tester,
  ) async {
    await pumpApp(tester, reduceMotion: true);
    final router = routerOf(tester)..go(AppRoutes.cookPath('52772'));
    await tester.pumpAndSettle();

    expect(
      tester.widget<CookModeScreen>(find.byType(CookModeScreen)).recipeId,
      '52772',
    );

    router.pop();
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<RecipeDetailScreen>(find.byType(RecipeDetailScreen))
          .recipeId,
      '52772',
    );

    router.pop();
    await tester.pumpAndSettle();
    expect(find.byType(DiscoverScreen), findsOneWidget);
  });

  testWidgets('a recipe opened from Saved goes back to Saved', (tester) async {
    await pumpApp(tester);
    final router = routerOf(tester)..go(AppRoutes.saved);
    await tester.pumpAndSettle();

    unawaited(router.push<void>(AppRoutes.recipePath('1')));
    await tester.pumpAndSettle();
    expect(find.byType(RecipeDetailScreen), findsOneWidget);

    router.pop();
    await tester.pumpAndSettle();
    expect(find.byType(SavedScreen), findsOneWidget);
  });

  group('PhoneFrame', () {
    testWidgets('phones get the app edge to edge', (tester) async {
      await pumpApp(tester);

      expect(tester.getSize(find.byType(Scaffold).first), phoneSize);
    });

    testWidgets('wide screens get a phone-sized frame', (tester) async {
      await pumpApp(tester, size: const Size(1280, 900));

      expect(
        tester.getSize(find.byType(Scaffold).first),
        const Size(430, 852),
      );
    });
  });
}
