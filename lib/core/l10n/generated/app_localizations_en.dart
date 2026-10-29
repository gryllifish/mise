// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Mise';

  @override
  String get retry => 'Try again';

  @override
  String get back => 'Back';

  @override
  String get close => 'Close';

  @override
  String get errorLoadData => 'We couldn\'t read this recipe data.';

  @override
  String get errorNotFound => 'We couldn\'t find that recipe.';

  @override
  String get errorUnexpected => 'Something went wrong. Please try again.';

  @override
  String get errorOffline =>
      'You\'re offline. Check your connection and try again.';

  @override
  String get errorTimeout => 'This is taking too long. Please try again.';

  @override
  String get errorServer =>
      'The recipe service is having trouble. Try again soon.';

  @override
  String get navDiscover => 'Discover';

  @override
  String get navSaved => 'Saved';

  @override
  String get navPantry => 'What I have';

  @override
  String get pantryTitle => 'What\'s in your kitchen?';

  @override
  String get pantrySubtitle =>
      'Add what you have and we\'ll suggest dishes that use it.';

  @override
  String get pantryAddHint => 'Add an ingredient';

  @override
  String get pantryCatalogError => 'We couldn\'t load the ingredient list.';

  @override
  String pantryYours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Your pantry · $count',
      one: 'Your pantry · 1',
    );
    return '$_temp0';
  }

  @override
  String get pantryClear => 'Clear all';

  @override
  String get pantryCleared => 'Pantry cleared.';

  @override
  String removeIngredient(String name) {
    return 'Remove $name';
  }

  @override
  String addIngredient(String name) {
    return 'Add $name';
  }

  @override
  String get pantryEmpty => 'Start with two or three things you have at home.';

  @override
  String get pantrySuggestions => 'Popular';

  @override
  String get pantryReady => 'Ready to cook';

  @override
  String get pantryAlmost => 'Almost there';

  @override
  String get pantryIdeas => 'More ideas';

  @override
  String pantryUses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Uses $count of yours',
      one: 'Uses 1 of yours',
    );
    return '$_temp0';
  }

  @override
  String get pantryHaveAll => 'You have everything';

  @override
  String pantryMissing(String names) {
    return 'Missing: $names';
  }

  @override
  String get pantryNoMatches =>
      'No recipes use these ingredients. Try adding another.';

  @override
  String get pantryBasics =>
      'Salt, pepper, water and oil count as always at hand.';

  @override
  String get discoverEyebrow => 'Mise en place';

  @override
  String get discoverTitle => 'What are we\ncooking today?';

  @override
  String get searchHint => 'Search recipes';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get todaysPick => 'Today\'s pick';

  @override
  String get categories => 'Categories';

  @override
  String get cuisines => 'Countries';

  @override
  String resultsFor(String query) {
    return 'Results for “$query”';
  }

  @override
  String noResults(String query) {
    return 'No recipes match “$query”.';
  }

  @override
  String recipeMeta(String category, String area) {
    return '$category · $area';
  }

  @override
  String openRecipe(String name) {
    return 'Open $name';
  }

  @override
  String get ingredients => 'Ingredients';

  @override
  String ingredientCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ingredients',
      one: '1 ingredient',
    );
    return '$_temp0';
  }

  @override
  String get method => 'Method';

  @override
  String stepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count steps',
      one: '1 step',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Start cooking';

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get nextStep => 'Next step';

  @override
  String get previousStep => 'Previous step';

  @override
  String get doneCooking => 'Done. Enjoy!';

  @override
  String get stepNeeds => 'You\'ll need';

  @override
  String startTimer(String duration) {
    return 'Start a $duration timer';
  }

  @override
  String get pauseTimer => 'Pause timer';

  @override
  String get resumeTimer => 'Resume timer';

  @override
  String get stopTimer => 'Stop timer';

  @override
  String get timerDone => 'Time\'s up!';

  @override
  String get finish => 'Finish';

  @override
  String get save => 'Save recipe';

  @override
  String get unsave => 'Remove from saved';

  @override
  String get savedTitle => 'Saved';

  @override
  String get savedSubtitle => 'Kept on this device, ready even offline.';

  @override
  String get savedEmpty =>
      'Recipes you save show up here, even without a connection.';

  @override
  String get savedEmptyAction => 'Discover recipes';

  @override
  String get savedOffline => 'Showing your saved copy while offline.';

  @override
  String removedFromSaved(String name) {
    return 'Removed “$name”.';
  }

  @override
  String get undo => 'Undo';

  @override
  String get removeSaved => 'Remove';
}
