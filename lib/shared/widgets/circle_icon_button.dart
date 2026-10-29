import 'package:flutter/material.dart';
import 'package:mise/core/theme/app_colors.dart';

/// Round icon button used in top bars.
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.backgroundColor = AppColors.iconButton,
    this.foregroundColor = AppColors.ink,
    super.key,
  });

  static const double size = 42;
  static const _iconSize = 20.0;
  static const _disabledOpacity = 0.4;

  final IconData icon;
  final String tooltip;

  /// Null disables the button.
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(icon, size: _iconSize),
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        // Dimmed, not gone: a disabled button keeps its place and shape.
        disabledBackgroundColor: backgroundColor.withValues(
          alpha: backgroundColor.a * _disabledOpacity,
        ),
        disabledForegroundColor: foregroundColor.withValues(
          alpha: _disabledOpacity,
        ),
        fixedSize: const Size.square(size),
        minimumSize: const Size.square(size),
      ),
    );
  }
}
