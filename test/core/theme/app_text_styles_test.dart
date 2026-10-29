import 'dart:io';

import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/theme/app_text_styles.dart';

/// google_fonts file names by weight, 100 to 900: "Fraunces-SemiBold.ttf".
const _weightNames = [
  'Thin',
  'ExtraLight',
  'Light',
  'Regular',
  'Medium',
  'SemiBold',
  'Bold',
  'ExtraBold',
  'Black',
];

void main() {
  // Fonts are bundled and never fetched, so a weight without its file
  // silently falls back to the system font.
  test('every text style has its font file bundled', () {
    final styles = {
      'display': AppTextStyles.display,
      'headline': AppTextStyles.headline,
      'title': AppTextStyles.title,
      'cardTitle': AppTextStyles.cardTitle,
      'step': AppTextStyles.step,
      'stepLong': AppTextStyles.stepLong,
      'stepNumber': AppTextStyles.stepNumber,
      'eyebrow': AppTextStyles.eyebrow,
      'label': AppTextStyles.label,
      'chip': AppTextStyles.chip,
      'body': AppTextStyles.body,
      'bodyMuted': AppTextStyles.bodyMuted,
      'caption': AppTextStyles.caption,
    };

    for (final MapEntry(key: name, value: style) in styles.entries) {
      final family = style.fontFamily!.split('_').first;
      final weight =
          _weightNames[(style.fontWeight ?? FontWeight.w400).value ~/ 100 - 1];
      final file = File('assets/google_fonts/$family-$weight.ttf');
      expect(file.existsSync(), isTrue, reason: '$name needs ${file.path}');
    }
  });
}
