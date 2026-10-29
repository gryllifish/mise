import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/shared/widgets/app_bottom_nav.dart';
import 'package:mise/shared/widgets/route_bottom_bar.dart';

import '../../helpers/pump_app.dart';

void main() {
  /// How far down each bar is pushed: 0 in place, 1 fully off screen.
  double offsetOf(WidgetTester tester, Finder bar) => tester
      .widget<FractionalTranslation>(
        find
            .ancestor(of: bar, matching: find.byType(FractionalTranslation))
            .first,
      )
      .translation
      .dy;

  final tabs = find.byType(AppBottomNav);
  final cookingBar = find.descendant(
    of: find.byType(RouteBottomBar).last,
    matching: find.text('Start cooking'),
  );

  testWidgets('the tab bar leaves before the recipe bar arrives, and back', (
    tester,
  ) async {
    await pumpApp(tester);
    expect(offsetOf(tester, tabs), 0);

    await tester.tap(find.text('Salmon bowl'));
    await tester.pump();
    await tester.pump(AppDurations.page * 0.25);
    expect(offsetOf(tester, tabs), inExclusiveRange(0, 1), reason: 'leaving');
    expect(offsetOf(tester, cookingBar), 1, reason: 'not arriving yet');

    await tester.pump(AppDurations.page * 0.4);
    expect(offsetOf(tester, tabs), 1, reason: 'gone');
    expect(offsetOf(tester, cookingBar), inExclusiveRange(0, 1));

    await tester.pumpAndSettle();
    expect(offsetOf(tester, cookingBar), 0);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(offsetOf(tester, tabs), 0, reason: 'back in place');
  });

  testWidgets('with reduced motion, bars jump with the page', (tester) async {
    await pumpApp(tester, reduceMotion: true);

    await tester.tap(find.text('Salmon bowl'));
    await tester.pump();
    await tester.pump();

    expect(offsetOf(tester, cookingBar), 0);
  });
}
