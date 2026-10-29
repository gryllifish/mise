/// Route paths. Features navigate with these constants so they never need
/// to import the router itself.
abstract final class AppRoutes {
  /// First tab.
  static const discover = '/';

  /// Second tab: recipes from what the user has at home.
  static const pantry = '/pantry';

  /// Third tab.
  static const saved = '/saved';

  /// Nested under [discover], so a deep link's back button lands there.
  /// Saved pushes it on top of itself, so back returns to Saved.
  static const recipe = 'recipes/:$recipeIdParam';
  static const recipeIdParam = 'id';

  /// Nested under [recipe].
  static const cook = 'cook';

  static String recipePath(String id) => '/recipes/$id';

  static String cookPath(String id) => '${recipePath(id)}/$cook';
}
