import 'package:flutter/widgets.dart';

/// Corner radius scale.
abstract final class AppRadius {
  static const double sm = 10;
  static const double md = 16;
  static const double lg = 22;
  static const double xl = 30;

  /// Corners of the phone frame shown on wide screens.
  static const double device = 38;

  /// Fully rounded ends for chips and pills.
  static const double pill = 999;
  static final BorderRadius pillBorder = BorderRadius.circular(pill);

  /// Rounded top corners of sheets sliding over photos.
  static const BorderRadius sheetTop = BorderRadius.vertical(
    top: Radius.circular(xl),
  );
}
