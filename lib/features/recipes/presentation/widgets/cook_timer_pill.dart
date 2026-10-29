import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/core/utils/formatters.dart';
import 'package:mise/features/recipes/controllers/cook_timer_controller.dart';

/// The running cook mode timer, visible on every step until stopped.
class CookTimerPill extends ConsumerWidget {
  const CookTimerPill({required this.recipeId, super.key});

  static const _iconSize = 18.0;

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(cookTimerControllerProvider(recipeId));
    if (timer == null) return const SizedBox.shrink();

    final l10n = context.l10n;
    final notifier = ref.read(cookTimerControllerProvider(recipeId).notifier);
    final foreground = timer.isDone ? AppColors.ink : AppColors.onPhoto;

    return Semantics(
      liveRegion: timer.isDone,
      child: Container(
        padding: const EdgeInsets.only(left: AppSpacing.md),
        decoration: BoxDecoration(
          color: timer.isDone ? AppColors.saffron : AppColors.photoScrim,
          borderRadius: AppRadius.pillBorder,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.xs,
          children: [
            Icon(
              timer.isDone ? Icons.alarm_on_rounded : Icons.timer_outlined,
              size: _iconSize,
              color: foreground,
            ),
            Text(
              timer.isDone
                  ? l10n.timerDone
                  : Formatters.countdown(timer.remaining),
              style: AppTextStyles.label.copyWith(
                color: foreground,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            if (!timer.isDone)
              IconButton(
                onPressed: timer.isRunning ? notifier.pause : notifier.resume,
                tooltip: timer.isRunning ? l10n.pauseTimer : l10n.resumeTimer,
                visualDensity: VisualDensity.compact,
                color: foreground,
                iconSize: _iconSize,
                icon: Icon(
                  timer.isRunning
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                ),
              ),
            IconButton(
              onPressed: notifier.stop,
              tooltip: l10n.stopTimer,
              visualDensity: VisualDensity.compact,
              color: foreground,
              iconSize: _iconSize,
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
