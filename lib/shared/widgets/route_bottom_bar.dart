import 'package:flutter/widgets.dart';
import 'package:mise/core/constants/app_durations.dart';

/// Moves a bottom bar with its page's route transitions, so bars never
/// stack up mid-transition: it slides off the bottom edge while another
/// page covers this one, and back when that page pops.
///
/// With [enterWithPage], it also rises in as its own page opens. It
/// follows the route's animations, so "Reduce motion" (zero-length
/// transitions) makes it jump with the page.
class RouteBottomBar extends StatelessWidget {
  const RouteBottomBar({
    required this.child,
    this.enterWithPage = false,
    super.key,
  });

  /// The covered page's bar leaves in the first half of the transition and
  /// the new page's bar arrives in the second, so the two never cross.
  /// Played backwards, popping swaps them the same way.
  static const _leave = Interval(0, 0.55, curve: AppCurves.emphasized);
  static const _arrive = Interval(0.35, 1, curve: AppCurves.emphasized);

  final Widget child;
  final bool enterWithPage;

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    final entering = route?.animation;
    final covered = route?.secondaryAnimation;
    if (entering == null || covered == null) return child;

    return AnimatedBuilder(
      animation: Listenable.merge([entering, covered]),
      builder: (context, child) {
        final hiddenByCover = _leave.transform(covered.value);
        final hiddenByEntry = enterWithPage
            ? 1 - _arrive.transform(entering.value)
            : 0.0;
        final hidden = hiddenByCover > hiddenByEntry
            ? hiddenByCover
            : hiddenByEntry;
        return FractionalTranslation(
          translation: Offset(0, hidden),
          child: child,
        );
      },
      child: child,
    );
  }
}
