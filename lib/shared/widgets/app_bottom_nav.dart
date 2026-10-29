import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';

/// The tabs of the app.
enum AppTab {
  discover(AppRoutes.discover),
  pantry(AppRoutes.pantry),
  saved(AppRoutes.saved);

  const AppTab(this.path);

  final String path;
}

/// Frosted bottom bar shared by the tab screens.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({required this.current, super.key});

  static const height = 64.0;

  final AppTab current;

  static const _blurSigma = 15.0;
  static const _backgroundOpacity = 0.92;
  static const _iconSize = 22.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = [
      (
        tab: AppTab.discover,
        icon: Icons.explore_outlined,
        selectedIcon: Icons.explore,
        label: l10n.navDiscover,
      ),
      (
        tab: AppTab.pantry,
        icon: Icons.kitchen_outlined,
        selectedIcon: Icons.kitchen,
        label: l10n.navPantry,
      ),
      (
        tab: AppTab.saved,
        icon: Icons.favorite_border_rounded,
        selectedIcon: Icons.favorite_rounded,
        label: l10n.navSaved,
      ),
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: _backgroundOpacity),
            border: const Border(top: BorderSide(color: AppColors.divider)),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: height,
              child: Row(
                children: [
                  for (final item in items)
                    Expanded(
                      child: _NavButton(
                        icon: item.tab == current
                            ? item.selectedIcon
                            : item.icon,
                        label: item.label,
                        selected: item.tab == current,
                        onTap: () => context.go(item.tab.path),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.tomato : AppColors.inkSubtle;

    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.xxs,
          children: [
            Icon(icon, color: color, size: AppBottomNav._iconSize),
            Text(label, style: AppTextStyles.caption.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
