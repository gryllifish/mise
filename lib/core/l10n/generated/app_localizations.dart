import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Mise'**
  String get appTitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @errorLoadData.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t read this recipe data.'**
  String get errorLoadData;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find that recipe.'**
  String get errorNotFound;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnexpected;

  /// No description provided for @errorOffline.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. Check your connection and try again.'**
  String get errorOffline;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'This is taking too long. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'The recipe service is having trouble. Try again soon.'**
  String get errorServer;

  /// No description provided for @navDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navDiscover;

  /// No description provided for @navSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get navSaved;

  /// No description provided for @navPantry.
  ///
  /// In en, this message translates to:
  /// **'What I have'**
  String get navPantry;

  /// No description provided for @pantryTitle.
  ///
  /// In en, this message translates to:
  /// **'What\'s in your kitchen?'**
  String get pantryTitle;

  /// No description provided for @pantrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add what you have and we\'ll suggest dishes that use it.'**
  String get pantrySubtitle;

  /// No description provided for @pantryAddHint.
  ///
  /// In en, this message translates to:
  /// **'Add an ingredient'**
  String get pantryAddHint;

  /// No description provided for @pantryCatalogError.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t load the ingredient list.'**
  String get pantryCatalogError;

  /// No description provided for @pantryYours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Your pantry · 1} other{Your pantry · {count}}}'**
  String pantryYours(int count);

  /// No description provided for @pantryClear.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get pantryClear;

  /// No description provided for @pantryCleared.
  ///
  /// In en, this message translates to:
  /// **'Pantry cleared.'**
  String get pantryCleared;

  /// No description provided for @removeIngredient.
  ///
  /// In en, this message translates to:
  /// **'Remove {name}'**
  String removeIngredient(String name);

  /// No description provided for @addIngredient.
  ///
  /// In en, this message translates to:
  /// **'Add {name}'**
  String addIngredient(String name);

  /// No description provided for @pantryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Start with two or three things you have at home.'**
  String get pantryEmpty;

  /// No description provided for @pantrySuggestions.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get pantrySuggestions;

  /// No description provided for @pantryReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to cook'**
  String get pantryReady;

  /// No description provided for @pantryAlmost.
  ///
  /// In en, this message translates to:
  /// **'Almost there'**
  String get pantryAlmost;

  /// No description provided for @pantryIdeas.
  ///
  /// In en, this message translates to:
  /// **'More ideas'**
  String get pantryIdeas;

  /// No description provided for @pantryUses.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Uses 1 of yours} other{Uses {count} of yours}}'**
  String pantryUses(int count);

  /// No description provided for @pantryHaveAll.
  ///
  /// In en, this message translates to:
  /// **'You have everything'**
  String get pantryHaveAll;

  /// No description provided for @pantryMissing.
  ///
  /// In en, this message translates to:
  /// **'Missing: {names}'**
  String pantryMissing(String names);

  /// No description provided for @pantryNoMatches.
  ///
  /// In en, this message translates to:
  /// **'No recipes use these ingredients. Try adding another.'**
  String get pantryNoMatches;

  /// No description provided for @pantryBasics.
  ///
  /// In en, this message translates to:
  /// **'Salt, pepper, water and oil count as always at hand.'**
  String get pantryBasics;

  /// No description provided for @discoverEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Mise en place'**
  String get discoverEyebrow;

  /// No description provided for @discoverTitle.
  ///
  /// In en, this message translates to:
  /// **'What are we\ncooking today?'**
  String get discoverTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search recipes'**
  String get searchHint;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// No description provided for @todaysPick.
  ///
  /// In en, this message translates to:
  /// **'Today\'s pick'**
  String get todaysPick;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cuisines.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get cuisines;

  /// No description provided for @resultsFor.
  ///
  /// In en, this message translates to:
  /// **'Results for “{query}”'**
  String resultsFor(String query);

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No recipes match “{query}”.'**
  String noResults(String query);

  /// No description provided for @recipeMeta.
  ///
  /// In en, this message translates to:
  /// **'{category} · {area}'**
  String recipeMeta(String category, String area);

  /// No description provided for @openRecipe.
  ///
  /// In en, this message translates to:
  /// **'Open {name}'**
  String openRecipe(String name);

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @ingredientCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 ingredient} other{{count} ingredients}}'**
  String ingredientCount(int count);

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @stepCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 step} other{{count} steps}}'**
  String stepCount(int count);

  /// No description provided for @startCooking.
  ///
  /// In en, this message translates to:
  /// **'Start cooking'**
  String get startCooking;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOf(int current, int total);

  /// No description provided for @nextStep.
  ///
  /// In en, this message translates to:
  /// **'Next step'**
  String get nextStep;

  /// No description provided for @previousStep.
  ///
  /// In en, this message translates to:
  /// **'Previous step'**
  String get previousStep;

  /// No description provided for @doneCooking.
  ///
  /// In en, this message translates to:
  /// **'Done. Enjoy!'**
  String get doneCooking;

  /// No description provided for @stepNeeds.
  ///
  /// In en, this message translates to:
  /// **'You\'ll need'**
  String get stepNeeds;

  /// No description provided for @startTimer.
  ///
  /// In en, this message translates to:
  /// **'Start a {duration} timer'**
  String startTimer(String duration);

  /// No description provided for @pauseTimer.
  ///
  /// In en, this message translates to:
  /// **'Pause timer'**
  String get pauseTimer;

  /// No description provided for @resumeTimer.
  ///
  /// In en, this message translates to:
  /// **'Resume timer'**
  String get resumeTimer;

  /// No description provided for @stopTimer.
  ///
  /// In en, this message translates to:
  /// **'Stop timer'**
  String get stopTimer;

  /// No description provided for @timerDone.
  ///
  /// In en, this message translates to:
  /// **'Time\'s up!'**
  String get timerDone;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save recipe'**
  String get save;

  /// No description provided for @unsave.
  ///
  /// In en, this message translates to:
  /// **'Remove from saved'**
  String get unsave;

  /// No description provided for @savedTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get savedTitle;

  /// No description provided for @savedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Kept on this device, ready even offline.'**
  String get savedSubtitle;

  /// No description provided for @savedEmpty.
  ///
  /// In en, this message translates to:
  /// **'Recipes you save show up here, even without a connection.'**
  String get savedEmpty;

  /// No description provided for @savedEmptyAction.
  ///
  /// In en, this message translates to:
  /// **'Discover recipes'**
  String get savedEmptyAction;

  /// No description provided for @savedOffline.
  ///
  /// In en, this message translates to:
  /// **'Showing your saved copy while offline.'**
  String get savedOffline;

  /// No description provided for @removedFromSaved.
  ///
  /// In en, this message translates to:
  /// **'Removed “{name}”.'**
  String removedFromSaved(String name);

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @removeSaved.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeSaved;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
