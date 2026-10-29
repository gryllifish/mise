import 'package:flutter/material.dart';

/// Color tokens: a warm, editorial palette (cream paper, ink, tomato).
abstract final class AppColors {
  // Surfaces
  static const background = Color(0xFFF7F1E8);
  static const surface = Color(0xFFFFFCF7);
  static const chip = Color(0xFFEFE5D6);
  static const divider = Color(0xFFE6DACA);
  static const Color iconButton = chip;

  /// Page behind the phone frame on wide screens (web on desktop).
  static const backdrop = Color(0xFFE4DACB);
  static const frameShadow = Color(0x3D3A2A1A);

  // Text
  static const ink = Color(0xFF221C17);
  static const inkMuted = Color(0xFF7B6E62);
  static const inkSubtle = Color(0xFFA49585);
  static const onPhoto = Color(0xFFFFFCF7);

  /// Secondary text and idle controls over photos.
  static const onPhotoMuted = Color(0xB3FFFCF7);

  /// Translucent fills over photos: idle story bars, icon buttons.
  static const onPhotoFaint = Color(0x40FFFCF7);

  // Accents
  static const tomato = Color(0xFFD9532B);
  static const tomatoSoft = Color(0xFFF6D9CC);
  static const olive = Color(0xFF5F6F3A);
  static const oliveSoft = Color(0xFFE3E6CF);
  static const saffron = Color(0xFFE8A33D);

  /// Darkens the bottom of photos so text on top stays readable.
  static const photoScrim = Color(0xB3221C17);

  /// Lighter shade over full-screen photos, where text sits low.
  static const photoShade = Color(0x59221C17);
}
