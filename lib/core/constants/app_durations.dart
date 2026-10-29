import 'package:flutter/widgets.dart';

/// Shared animation durations so motion feels consistent across the app.
abstract final class AppDurations {
  /// Color and state changes on small controls.
  static const fast = Duration(milliseconds: 250);

  /// Element fade and scale transitions.
  static const medium = Duration(milliseconds: 350);

  /// Page transitions and card entrances.
  static const page = Duration(milliseconds: 480);

  /// One slow zoom of the cook mode photo (Ken Burns), there and back.
  static const kenBurns = Duration(seconds: 18);

  /// The cook mode photo drifting to a new focal point between steps.
  static const focusShift = Duration(milliseconds: 1400);

  /// Delay between consecutive items entering a list or grid.
  static const stagger = Duration(milliseconds: 45);
}

/// Shared easing curves.
abstract final class AppCurves {
  /// Fast start, long soft landing. Used for entrances and page transitions.
  static const emphasized = Cubic(0.2, 0.8, 0.2, 1);
}

/// Honors the OS "Reduce motion" setting.
extension ReducedMotion on BuildContext {
  /// Whether the user asked the OS to minimize animations.
  bool get reduceMotion => MediaQuery.disableAnimationsOf(this);

  /// [duration], or zero when the user asked to reduce motion.
  Duration motion(Duration duration) => reduceMotion ? Duration.zero : duration;
}
