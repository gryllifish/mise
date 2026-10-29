import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.tomato,
        primary: AppColors.tomato,
        surface: AppColors.surface,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(
        base.textTheme,
      ).apply(bodyColor: AppColors.ink, displayColor: AppColors.ink),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.tomato,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.tomato,
          foregroundColor: AppColors.onPhoto,
          // Clearly inert while, e.g., the recipe is still loading.
          disabledBackgroundColor: AppColors.chip,
          disabledForegroundColor: AppColors.inkSubtle,
          textStyle: AppTextStyles.label,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.ink,
        contentTextStyle: AppTextStyles.body.copyWith(color: AppColors.onPhoto),
      ),
    );
  }
}
