import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mise/core/theme/app_colors.dart';

/// Fraunces (serif) for headings, Inter for everything else.
abstract final class AppTextStyles {
  /// Soft shadow that keeps text readable over busy, light photos.
  static const onPhotoShadows = [
    Shadow(color: AppColors.photoScrim, blurRadius: 12),
  ];

  static TextStyle get display => GoogleFonts.fraunces(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.02,
    letterSpacing: -1.2,
    color: AppColors.ink,
  );

  static TextStyle get headline => GoogleFonts.fraunces(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    height: 1.08,
    letterSpacing: -0.8,
    color: AppColors.ink,
  );

  static TextStyle get title => GoogleFonts.fraunces(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    color: AppColors.ink,
  );

  static TextStyle get cardTitle => GoogleFonts.fraunces(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.15,
    color: AppColors.ink,
  );

  /// Big step text in cook mode, readable from arm's length.
  static TextStyle get step => GoogleFonts.fraunces(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.3,
    color: AppColors.ink,
  );

  /// [step] for long steps, so they fit without scrolling. Same weight:
  /// only the bundled Fraunces weights (600, 700) render as Fraunces.
  static TextStyle get stepLong => GoogleFonts.fraunces(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.ink,
  );

  static TextStyle get stepNumber => GoogleFonts.fraunces(
    fontSize: 64,
    fontWeight: FontWeight.w700,
    height: 1,
    color: AppColors.tomato,
  );

  /// Uppercase labels ("TODAY'S PICK", "INGREDIENTS").
  static TextStyle get eyebrow => GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.4,
    color: AppColors.inkMuted,
  );

  static TextStyle get label => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.ink,
  );

  static TextStyle get chip => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.ink,
  );

  static TextStyle get body => GoogleFonts.inter(
    fontSize: 15,
    height: 1.5,
    color: AppColors.ink,
  );

  static TextStyle get bodyMuted => GoogleFonts.inter(
    fontSize: 14,
    height: 1.45,
    color: AppColors.inkMuted,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.inkMuted,
  );
}
