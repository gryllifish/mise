import 'package:flutter/material.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';

/// A chip's value and what it shows.
typedef ChipOption = ({String value, String label});

/// Horizontally scrolling pills, such as categories or cuisines; one is
/// always selected.
class SelectionChips extends StatelessWidget {
  const SelectionChips({
    required this.options,
    required this.selected,
    required this.onSelected,
    super.key,
  });

  static const height = 38.0;

  final List<ChipOption> options;
  final String? selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenHorizontal,
        ),
        itemCount: options.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final (:value, :label) = options[index];
          return _Chip(
            label: label,
            selected: value == selected,
            onTap: () => onSelected(value),
          );
        },
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final duration = context.motion(AppDurations.fast);

    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeOut,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          decoration: BoxDecoration(
            color: selected ? AppColors.ink : AppColors.chip,
            borderRadius: AppRadius.pillBorder,
          ),
          child: AnimatedDefaultTextStyle(
            duration: duration,
            style: AppTextStyles.chip.copyWith(
              color: selected ? AppColors.onPhoto : AppColors.ink,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
