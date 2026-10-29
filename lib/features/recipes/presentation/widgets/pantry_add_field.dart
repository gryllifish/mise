import 'package:flutter/material.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/theme/app_colors.dart';
import 'package:mise/core/theme/app_radius.dart';
import 'package:mise/core/theme/app_spacing.dart';
import 'package:mise/core/theme/app_text_styles.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/shared/widgets/app_network_image.dart';

/// Search field that suggests catalog ingredients, with their photo, as
/// the user types. Picking one adds it and clears the field for the next.
class PantryAddField extends StatefulWidget {
  const PantryAddField({
    required this.catalog,
    required this.pantry,
    required this.onAdd,
    super.key,
  });

  final List<CatalogIngredient> catalog;
  final List<String> pantry;
  final ValueChanged<String> onAdd;

  @override
  State<PantryAddField> createState() => _PantryAddFieldState();
}

class _PantryAddFieldState extends State<PantryAddField> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  static const _optionsMaxHeight = 280.0;
  static const _optionPhotoSize = 36.0;

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _add(CatalogIngredient ingredient) {
    widget.onAdd(ingredient.name);
    _controller.clear();
    // Stays ready for the next ingredient.
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: AppRadius.pillBorder,
      borderSide: BorderSide.none,
    );

    return LayoutBuilder(
      builder: (context, constraints) => RawAutocomplete<CatalogIngredient>(
        textEditingController: _controller,
        focusNode: _focus,
        displayStringForOption: (ingredient) => ingredient.name,
        optionsBuilder: (value) =>
            searchCatalog(widget.catalog, value.text, pantry: widget.pantry),
        onSelected: _add,
        fieldViewBuilder: (context, controller, focusNode, onSubmitted) =>
            TextField(
              controller: controller,
              focusNode: focusNode,
              onSubmitted: (_) => onSubmitted(),
              textInputAction: TextInputAction.done,
              style: AppTextStyles.body,
              cursorColor: AppColors.tomato,
              decoration: InputDecoration(
                hintText: context.l10n.pantryAddHint,
                hintStyle: AppTextStyles.body.copyWith(
                  color: AppColors.inkSubtle,
                ),
                filled: true,
                fillColor: AppColors.chip,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.md,
                ),
                prefixIcon: const Icon(
                  Icons.add_rounded,
                  color: AppColors.inkMuted,
                ),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
        optionsViewBuilder: (context, onSelected, options) => Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Material(
              color: AppColors.surface,
              elevation: 6,
              shadowColor: AppColors.frameShadow,
              borderRadius: BorderRadius.circular(AppRadius.md),
              clipBehavior: Clip.antiAlias,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: _optionsMaxHeight,
                  maxWidth: constraints.maxWidth,
                ),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                  shrinkWrap: true,
                  children: [
                    for (final ingredient in options)
                      ListTile(
                        onTap: () => onSelected(ingredient),
                        leading: SizedBox.square(
                          dimension: _optionPhotoSize,
                          child: AppNetworkImage(
                            url: ingredient.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(ingredient.name, style: AppTextStyles.body),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
