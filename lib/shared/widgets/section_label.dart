import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_text_styles.dart';

/// Small uppercase label above a section ("CATEGORIES", "METHOD").
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {this.color, super.key});

  final String text;

  /// Defaults to the eyebrow's muted ink.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text(
        text.toUpperCase(),
        style: AppTextStyles.eyebrow.copyWith(color: color),
      ),
    );
  }
}
