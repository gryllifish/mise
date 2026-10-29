import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/core/utils/formatters.dart';

/// The method as numbered steps.
class MethodSteps extends StatelessWidget {
  const MethodSteps({required this.steps, super.key});

  static const _numberWidth = 32.0;

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    final numberStyle = AppTextStyles.cardTitle.copyWith(
      color: AppTextStyles.stepNumber.color,
    );

    return Column(
      spacing: AppSpacing.lg,
      children: [
        for (final (index, step) in steps.indexed)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _numberWidth,
                child: Text(
                  Formatters.twoDigits(index + 1),
                  style: numberStyle,
                ),
              ),
              Expanded(child: Text(step, style: AppTextStyles.body)),
            ],
          ),
      ],
    );
  }
}
