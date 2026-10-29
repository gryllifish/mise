import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/controllers/discover_controller.dart';

/// Pill search field. Every keystroke goes to [SearchQueryController],
/// which debounces it.
class RecipeSearchField extends ConsumerStatefulWidget {
  const RecipeSearchField({super.key});

  @override
  ConsumerState<RecipeSearchField> createState() => _RecipeSearchFieldState();
}

class _RecipeSearchFieldState extends ConsumerState<RecipeSearchField> {
  // Starts from the kept query, so coming back to the tab shows it.
  late final _controller = TextEditingController(
    text: ref.read(searchQueryControllerProvider),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    ref.read(searchQueryControllerProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final border = OutlineInputBorder(
      borderRadius: AppRadius.pillBorder,
      borderSide: BorderSide.none,
    );

    return TextField(
      controller: _controller,
      onChanged: ref.read(searchQueryControllerProvider.notifier).search,
      textInputAction: TextInputAction.search,
      style: AppTextStyles.body,
      cursorColor: AppColors.tomato,
      decoration: InputDecoration(
        hintText: l10n.searchHint,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.inkSubtle),
        filled: true,
        fillColor: AppColors.chip,
        contentPadding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        prefixIcon: const Icon(Icons.search_rounded, color: AppColors.inkMuted),
        suffixIcon: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) => _controller.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: _clear,
                  tooltip: l10n.clearSearch,
                  icon: const Icon(
                    Icons.close_rounded,
                    color: AppColors.inkMuted,
                  ),
                ),
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
