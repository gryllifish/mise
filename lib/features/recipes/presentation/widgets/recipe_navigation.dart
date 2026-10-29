import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/core/l10n/l10n.dart';
import 'package:mise/core/router/app_routes.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

/// Hero tags for recipe photos. The same recipe can show twice on one page
/// (today's pick and the grid), so each place gets its own tag and passes
/// it to the detail screen through the route's `extra`.
abstract final class RecipeHeroTags {
  static String pick(String id) => 'pick/$id';

  static String grid(String id) => 'grid/$id';

  static String saved(String id) => 'saved/$id';

  static String pantry(String id) => 'pantry/$id';

  /// Used by the detail screen when opened from a deep link.
  static String detail(String id) => 'detail/$id';
}

/// What a list already shows about a recipe, handed to the detail screen
/// through the route's `extra`: the photo can fly in and the title show
/// before the full recipe loads.
@immutable
class RecipePreview {
  const RecipePreview({
    required this.heroTag,
    required this.name,
    required this.photoUrl,
  });

  final String heroTag;
  final String name;

  /// Photo the list already loaded, shown until the full-size one arrives.
  final String photoUrl;
}

/// Opens the recipe detail on top of the current page, so back returns
/// here.
void openRecipe(BuildContext context, String id, RecipePreview preview) =>
    unawaited(context.push<void>(AppRoutes.recipePath(id), extra: preview));

extension RecipeMeta on Recipe {
  /// "Category · Area", skipping whichever the API left blank.
  String meta(AppLocalizations l10n) => switch ((category, area)) {
    (final category, '') => category,
    ('', final area) => area,
    (final category, final area) => l10n.recipeMeta(category, area),
  };
}
