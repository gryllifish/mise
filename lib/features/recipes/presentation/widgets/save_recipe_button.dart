import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/constants/app_durations.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/l10n/failure_messages.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/features/recipes/controllers/saved_recipes_controller.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/shared/widgets/circle_icon_button.dart';

/// Heart that saves the recipe for offline use, or removes it.
///
/// Disabled until [recipe] has loaded, since saving needs all of it.
class SaveRecipeButton extends ConsumerWidget {
  const SaveRecipeButton({required this.recipeId, this.recipe, super.key});

  final String recipeId;
  final Recipe? recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isSaved = ref.watch(isRecipeSavedProvider(recipeId));
    final loaded = recipe;

    return AnimatedSwitcher(
      duration: context.motion(AppDurations.fast),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: CircleIconButton(
        key: ValueKey(isSaved),
        icon: isSaved ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        tooltip: isSaved ? l10n.unsave : l10n.save,
        backgroundColor: AppColors.surface,
        foregroundColor: isSaved ? AppColors.tomato : AppColors.ink,
        onPressed: loaded == null
            ? null
            : () => unawaited(toggleSavedRecipe(context, ref, loaded)),
      ),
    );
  }
}

/// Saves [recipe], or removes it if saved, and explains a failure in a
/// snack bar. Returns whether it worked.
Future<bool> toggleSavedRecipe(
  BuildContext context,
  WidgetRef ref,
  Recipe recipe,
) async {
  final messenger = ScaffoldMessenger.of(context);
  final l10n = context.l10n;
  try {
    await ref.read(savedRecipesControllerProvider.notifier).toggle(recipe);
    return true;
  } on Failure catch (failure) {
    // The controller already rolled the change back.
    messenger.showSnackBar(SnackBar(content: Text(failure.message(l10n))));
    return false;
  }
}
