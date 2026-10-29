import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/l10n/failure_messages.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/core/utils/formatters.dart';
import 'package:mise/features/recipes/controllers/cook_timer_controller.dart';
import 'package:mise/features/recipes/controllers/recipe_controller.dart';
import 'package:mise/features/recipes/domain/entities/cook_step.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/presentation/widgets/cook_backdrop.dart';
import 'package:mise/features/recipes/presentation/widgets/cook_progress_bars.dart';
import 'package:mise/features/recipes/presentation/widgets/cook_timer_pill.dart';
import 'package:mise/features/recipes/presentation/widgets/ingredient_list.dart';
import 'package:mise/features/recipes/presentation/widgets/step_ingredients.dart';
import 'package:mise/shared/widgets/circle_icon_button.dart';
import 'package:mise/shared/widgets/error_view.dart';
import 'package:mise/shared/widgets/section_label.dart';

const _horizontal = EdgeInsets.symmetric(
  horizontal: AppSpacing.screenHorizontal,
);

/// Full-screen, story-style cooking: one step per page over the dish
/// photo, with the ingredients that step uses and a timer when it names a
/// duration.
///
/// Swipe, tap the right or left side, use the buttons or the arrow keys to
/// move between steps. Unlike stories, pages never advance on their own: a
/// step takes minutes, not seconds.
class CookModeScreen extends ConsumerWidget {
  const CookModeScreen({required this.recipeId, super.key});

  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lookup = ref.watch(recipeControllerProvider(recipeId));

    return Scaffold(
      backgroundColor: lookup is AsyncData ? AppColors.ink : null,
      body: switch (lookup) {
        AsyncData(:final value) => _CookSteps(recipe: value.recipe),
        AsyncError(:final error) => SafeArea(
          child: ErrorView(
            message: context.l10n.errorMessage(error),
            onRetry: ref
                .read(recipeControllerProvider(recipeId).notifier)
                .retry,
          ),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _CookSteps extends ConsumerStatefulWidget {
  const _CookSteps({required this.recipe});

  final Recipe recipe;

  @override
  ConsumerState<_CookSteps> createState() => _CookStepsState();
}

class _CookStepsState extends ConsumerState<_CookSteps> {
  final _pages = PageController();
  late final List<CookStep> _steps = widget.recipe.cookSteps;
  var _page = 0;

  /// The last page is the "Done" page, after every step.
  int get _donePage => _steps.length;

  bool get _isDone => _page == _donePage;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _goTo(int page) {
    if (page < 0 || page > _donePage) return;
    final duration = context.motion(AppDurations.medium);
    if (duration == Duration.zero) {
      _pages.jumpToPage(page);
    } else {
      _pages.animateToPage(
        page,
        duration: duration,
        curve: AppCurves.emphasized,
      );
    }
  }

  void _next() => _goTo(_page + 1);

  void _previous() => _goTo(_page - 1);

  void _showIngredients() => unawaited(
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheetTop),
      builder: (context) => _IngredientsSheet(recipe: widget.recipe),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final recipe = widget.recipe;
    final timerProvider = cookTimerControllerProvider(recipe.id);

    // Time's up: a buzz and a chime, wherever the cook is.
    ref.listen(timerProvider, (previous, next) {
      if (next != null && next.isDone && !(previous?.isDone ?? false)) {
        unawaited(HapticFeedback.heavyImpact());
        unawaited(SystemSound.play(SystemSoundType.alert));
      }
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.arrowRight): _next,
          const SingleActivator(LogicalKeyboardKey.arrowLeft): _previous,
        },
        child: Focus(
          autofocus: true,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CookBackdrop(
                imageUrl: recipe.imageUrl,
                placeholderUrl: recipe.thumbnailUrl,
                page: _page,
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: _horizontal.copyWith(top: AppSpacing.md),
                      child: Column(
                        spacing: AppSpacing.md,
                        children: [
                          CookProgressBars(
                            count: _steps.length,
                            current: _page,
                          ),
                          _TopBar(
                            title: _isDone
                                ? recipe.name
                                : l10n.stepOf(_page + 1, _steps.length),
                            onClose: context.pop,
                            onIngredients: _showIngredients,
                          ),
                          CookTimerPill(recipeId: recipe.id),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pages,
                        itemCount: _steps.length + 1,
                        onPageChanged: (page) => setState(() => _page = page),
                        itemBuilder: (context, index) => index == _donePage
                            ? _DonePage(
                                recipeName: recipe.name,
                                onFinish: context.pop,
                              )
                            : _StepPage(
                                number: index + 1,
                                step: _steps[index],
                                onNext: _next,
                                onPrevious: _previous,
                              ),
                      ),
                    ),
                    if (!_isDone)
                      Padding(
                        padding: _horizontal.copyWith(
                          top: AppSpacing.md,
                          bottom: AppSpacing.md,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: AppSpacing.md,
                          children: [
                            // Here rather than in the page, so it never
                            // scrolls out of sight on a long step.
                            if (_steps[_page].timer case final timer?)
                              _StartTimerButton(
                                duration: timer,
                                onPressed: () => ref
                                    .read(timerProvider.notifier)
                                    .start(_page, timer),
                              ),
                            Row(
                              spacing: AppSpacing.md,
                              children: [
                                CircleIconButton(
                                  icon: Icons.arrow_back_rounded,
                                  tooltip: l10n.previousStep,
                                  backgroundColor: AppColors.onPhotoFaint,
                                  foregroundColor: AppColors.onPhoto,
                                  onPressed: _page == 0 ? null : _previous,
                                ),
                                Expanded(
                                  child: FilledButton(
                                    onPressed: _next,
                                    child: Text(
                                      _page == _donePage - 1
                                          ? l10n.finish
                                          : l10n.nextStep,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.title,
    required this.onClose,
    required this.onIngredients,
  });

  final String title;
  final VoidCallback onClose;
  final VoidCallback onIngredients;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      children: [
        CircleIconButton(
          icon: Icons.close_rounded,
          tooltip: l10n.close,
          backgroundColor: AppColors.onPhotoFaint,
          foregroundColor: AppColors.onPhoto,
          onPressed: onClose,
        ),
        Expanded(
          child: Semantics(
            liveRegion: true,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.label.copyWith(color: AppColors.onPhoto),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        CircleIconButton(
          icon: Icons.format_list_bulleted_rounded,
          tooltip: l10n.ingredients,
          backgroundColor: AppColors.onPhotoFaint,
          foregroundColor: AppColors.onPhoto,
          onPressed: onIngredients,
        ),
      ],
    );
  }
}

class _StepPage extends StatelessWidget {
  const _StepPage({
    required this.number,
    required this.step,
    required this.onNext,
    required this.onPrevious,
  });

  /// Taps on the left part of the page go back, like stories.
  static const double _backZone = 1 / 3;

  /// Longer steps use a smaller face so they still fit over the photo.
  static const _longStep = 180;

  static const double _fadeHeight = AppSpacing.xxl;

  final int number;
  final CookStep step;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textStyle =
        (step.text.length > _longStep
                ? AppTextStyles.stepLong
                : AppTextStyles.step)
            .copyWith(
              color: AppColors.onPhoto,
              shadows: AppTextStyles.onPhotoShadows,
            );

    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapUp: (details) =>
            details.localPosition.dx < constraints.maxWidth * _backZone
            ? onPrevious()
            : onNext(),
        // Long steps fade out at the bottom, hinting there's more to scroll.
        // Long steps fade out at the bottom, hinting there's more to scroll.
        child: ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [(1 - _fadeHeight / bounds.height).clamp(0, 1), 1],
            colors: const [Colors.white, Colors.transparent],
          ).createShader(bounds),
          // Anchored at the top, so the step number sits at the same
          // height on every page, whatever the length of the text.
          child: SingleChildScrollView(
            padding: _horizontal.copyWith(
              top: AppSpacing.xxl,
              // Room for the fade, so the last line ends up clear.
              bottom: _fadeHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExcludeSemantics(
                  child: Text(
                    Formatters.twoDigits(number),
                    style: AppTextStyles.stepNumber.copyWith(
                      color: AppColors.saffron,
                      shadows: AppTextStyles.onPhotoShadows,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(step.text, style: textStyle),
                if (step.ingredients.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  SectionLabel(l10n.stepNeeds, color: AppColors.onPhotoMuted),
                  const SizedBox(height: AppSpacing.md),
                  StepIngredients(ingredients: step.ingredients),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StartTimerButton extends StatelessWidget {
  const _StartTimerButton({required this.duration, required this.onPressed});

  final Duration duration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.onPhoto,
        backgroundColor: AppColors.photoScrim,
        iconColor: AppColors.saffron,
        side: const BorderSide(color: AppColors.onPhotoFaint),
        shape: const StadiumBorder(),
        textStyle: AppTextStyles.label,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        visualDensity: VisualDensity.compact,
      ),
      onPressed: onPressed,
      icon: const Icon(Icons.timer_outlined),
      label: Text(
        context.l10n.startTimer(Formatters.shortDuration(duration)),
      ),
    );
  }
}

class _DonePage extends StatelessWidget {
  const _DonePage({required this.recipeName, required this.onFinish});

  static const _iconSize = 56.0;

  final String recipeName;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: _horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.lg,
        children: [
          const Icon(
            Icons.restaurant_rounded,
            size: _iconSize,
            color: AppColors.saffron,
          ),
          Semantics(
            header: true,
            child: Text(
              l10n.doneCooking,
              style: AppTextStyles.display.copyWith(color: AppColors.onPhoto),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            recipeName,
            style: AppTextStyles.title.copyWith(color: AppColors.onPhotoMuted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(onPressed: onFinish, child: Text(l10n.finish)),
        ],
      ),
    );
  }
}

class _IngredientsSheet extends StatelessWidget {
  const _IngredientsSheet({required this.recipe});

  /// The sheet never covers more than this share of the screen.
  static const _maxHeightFactor = 0.75;

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * _maxHeightFactor,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.screenHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.sm,
            children: [
              SectionLabel(context.l10n.ingredients),
              IngredientList(ingredients: recipe.ingredients),
            ],
          ),
        ),
      ),
    );
  }
}
