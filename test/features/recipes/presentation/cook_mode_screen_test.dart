import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/presentation/screens/cook_mode_screen.dart';
import 'package:mise/features/recipes/presentation/screens/recipe_detail_screen.dart';

import '../../../helpers/pump_app.dart';

void main() {
  /// Opens cook mode for a fake recipe with three steps; the first one
  /// cooks the rice for 10 minutes.
  Future<void> startCooking(WidgetTester tester) async {
    await pumpApp(tester, reduceMotion: true);
    routerOf(tester).go(AppRoutes.cookPath('7'));
    await tester.pumpAndSettle();
  }

  Future<void> tapAt(WidgetTester tester, double widthFraction) async {
    final page = tester.getRect(find.byType(PageView));
    await tester.tapAt(
      Offset(page.left + page.width * widthFraction, page.center.dy),
    );
    await tester.pumpAndSettle();
  }

  Future<void> next(WidgetTester tester) async {
    await tester.tap(find.text('Next step'));
    await tester.pumpAndSettle();
  }

  testWidgets('starts on the first step, with nothing before it', (
    tester,
  ) async {
    await startCooking(tester);

    expect(find.text('Step 1 of 3'), findsOneWidget);
    expect(find.text('Cook the rice for 10 minutes.'), findsOneWidget);
    final previous = find.ancestor(
      of: find.byTooltip('Previous step'),
      matching: find.byType(IconButton),
    );
    expect(tester.widget<IconButton>(previous).onPressed, isNull);
  });

  testWidgets('the step number sits at the same height on every step', (
    tester,
  ) async {
    await startCooking(tester);
    final first = tester.getTopLeft(find.text('01'));

    await next(tester);
    final second = tester.getTopLeft(find.text('02'));

    // Step 1 lists ingredients and step 2 doesn't; the number must not
    // move with the amount of content.
    expect(second, first);
  });

  testWidgets('shows the ingredients the step uses', (tester) async {
    await startCooking(tester);

    expect(find.text("YOU'LL NEED"), findsOneWidget);
    expect(find.bySemanticsLabel('Rice, 2 cups'), findsOneWidget);
    expect(find.bySemanticsLabel('Salmon, 200g'), findsNothing);

    await next(tester);
    expect(find.bySemanticsLabel('Salmon, 200g'), findsOneWidget);

    await next(tester);
    expect(find.text("YOU'LL NEED"), findsNothing, reason: '"Serve."');
  });

  testWidgets('next and previous move between steps', (tester) async {
    await startCooking(tester);

    await next(tester);
    expect(find.text('Step 2 of 3'), findsOneWidget);
    expect(find.text('Slice the salmon.'), findsOneWidget);

    await tester.tap(find.byTooltip('Previous step'));
    await tester.pumpAndSettle();
    expect(find.text('Step 1 of 3'), findsOneWidget);
  });

  testWidgets('tapping the right side advances, the left goes back', (
    tester,
  ) async {
    await startCooking(tester);

    await tapAt(tester, 0.8);
    expect(find.text('Step 2 of 3'), findsOneWidget);

    await tapAt(tester, 0.1);
    expect(find.text('Step 1 of 3'), findsOneWidget);
  });

  testWidgets('swiping advances', (tester) async {
    await startCooking(tester);

    await tester.fling(find.byType(PageView), const Offset(-300, 0), 1000);
    await tester.pumpAndSettle();

    expect(find.text('Step 2 of 3'), findsOneWidget);
  });

  testWidgets('arrow keys move between steps', (tester) async {
    await startCooking(tester);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
    await tester.pumpAndSettle();
    expect(find.text('Step 2 of 3'), findsOneWidget);

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();
    expect(find.text('Step 1 of 3'), findsOneWidget);
  });

  group('timer', () {
    testWidgets('a step naming a duration offers one', (tester) async {
      await startCooking(tester);

      expect(find.text('Start a 10 min timer'), findsOneWidget);

      await next(tester);
      expect(find.textContaining('timer'), findsNothing);
    });

    testWidgets('sits with the controls, aligned with them', (tester) async {
      await startCooking(tester);

      final timer = tester.getRect(find.text('Start a 10 min timer'));
      final previous = tester.getRect(find.byTooltip('Previous step'));
      final next = tester.getRect(find.text('Next step'));
      final page = tester.getRect(find.byType(PageView));

      expect(timer.top, greaterThanOrEqualTo(page.bottom), reason: 'fixed');
      expect(timer.bottom, lessThan(next.top));
      expect(
        tester.getTopLeft(find.byType(OutlinedButton)).dx,
        tester
            .getTopLeft(
              find.ancestor(
                of: find.byTooltip('Previous step'),
                matching: find.byType(IconButton),
              ),
            )
            .dx,
      );
      expect(previous.width, greaterThan(0), reason: 'keeps its place');
    });

    testWidgets('counts down across steps and can be paused', (
      tester,
    ) async {
      await startCooking(tester);
      await tester.tap(find.text('Start a 10 min timer'));
      await tester.pump();
      expect(find.text('10:00'), findsOneWidget);

      await tester.pump(const Duration(seconds: 61));
      expect(find.text('8:59'), findsOneWidget);

      // Still counting on the next step.
      await next(tester);
      expect(find.textContaining(RegExp(r'^8:5\d$')), findsOneWidget);

      await tester.tap(find.byTooltip('Pause timer'));
      await tester.pump();
      final paused = tester.widget<Text>(
        find.textContaining(RegExp(r'^8:5\d$')),
      );
      await tester.pump(const Duration(minutes: 2));
      expect(find.text(paused.data!), findsOneWidget);

      await tester.tap(find.byTooltip('Stop timer'));
      await tester.pump();
      expect(find.byTooltip('Resume timer'), findsNothing);
    });

    testWidgets("says when time's up", (tester) async {
      await startCooking(tester);
      await tester.tap(find.text('Start a 10 min timer'));
      await tester.pump();

      await tester.pump(const Duration(minutes: 10, seconds: 1));

      expect(find.text("Time's up!"), findsOneWidget);
      expect(find.byTooltip('Pause timer'), findsNothing);
    });
  });

  testWidgets('the list button shows every ingredient', (tester) async {
    await startCooking(tester);

    await tester.tap(find.byTooltip('Ingredients'));
    await tester.pumpAndSettle();

    Finder inSheet(String text) => find.descendant(
      of: find.byType(BottomSheet),
      matching: find.text(text),
    );
    expect(inSheet('INGREDIENTS'), findsOneWidget);
    expect(inSheet('2 cups'), findsOneWidget);
    expect(inSheet('200g'), findsOneWidget);
  });

  testWidgets('after the last step, celebrates and finishes', (tester) async {
    await startCooking(tester);
    await next(tester);
    await next(tester);

    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle();
    expect(find.text('Done. Enjoy!'), findsOneWidget);

    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle();
    expect(find.byType(CookModeScreen), findsNothing);
    expect(find.byType(RecipeDetailScreen), findsOneWidget);
  });
}
