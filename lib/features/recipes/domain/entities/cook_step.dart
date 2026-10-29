import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mise/features/recipes/domain/entities/ingredient_names.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

part 'cook_step.freezed.dart';

/// One page of cook mode: a step and what it needs at hand.
@freezed
abstract class CookStep with _$CookStep {
  const factory CookStep({
    required String text,

    /// Ingredients the step mentions, in recipe order.
    required List<Ingredient> ingredients,

    /// The first duration the step mentions ("simmer for 10 minutes"),
    /// offered as a timer.
    Duration? timer,
  }) = _CookStep;
}

extension RecipeCookSteps on Recipe {
  /// The method as cook mode pages.
  List<CookStep> get cookSteps => [
    for (final step in steps)
      CookStep(
        text: step,
        ingredients: mentionedIngredients(step, ingredients),
        timer: mentionedDuration(step),
      ),
  ];
}

/// Ingredients from [ingredients] that [step] names.
///
/// Matches the full name ("soy sauce") or its last word ("ginger" for
/// "ground ginger"), ignoring case, punctuation and plurals.
List<Ingredient> mentionedIngredients(
  String step,
  List<Ingredient> ingredients,
) {
  final stems = ingredientStems(step);
  final text = ' ${stems.join(' ')} ';
  final stemSet = stems.toSet();

  bool mentions(Ingredient ingredient) {
    final words = ingredientStems(ingredient.name);
    if (words.isEmpty) return false;
    if (text.contains(' ${words.join(' ')} ')) return true;
    final head = words.last;
    return head.length >= _minHeadLength && stemSet.contains(head);
  }

  return [
    for (final ingredient in ingredients)
      if (mentions(ingredient)) ingredient,
  ];
}

/// The first duration in [step], e.g. "cook for 10-15 minutes" is 10
/// minutes and "for one hour" is an hour. Null when there is none.
Duration? mentionedDuration(String step) {
  final match = _durationPattern.firstMatch(step.toLowerCase());
  if (match == null) return null;

  final amount = switch (match.namedGroup('amount')) {
    final String text when text.startsWith('half') => 0.5,
    final String text =>
      double.tryParse(text.replaceAll(',', '.')) ?? _numberWords[text],
    null => null,
  };
  if (amount == null || amount <= 0) return null;

  final unit = match.namedGroup('unit') ?? '';
  final seconds = switch (unit[0]) {
    'h' => amount * Duration.secondsPerHour,
    'm' => amount * Duration.secondsPerMinute,
    _ => amount,
  };
  return Duration(seconds: seconds.round());
}

/// Shorter last words ("oil" is fine, "a" is not) match too loosely.
const _minHeadLength = 3;

const _numberWords = {
  'a': 1.0,
  'an': 1.0,
  'one': 1.0,
  'two': 2.0,
  'three': 3.0,
  'four': 4.0,
  'five': 5.0,
  'six': 6.0,
  'seven': 7.0,
  'eight': 8.0,
  'nine': 9.0,
  'ten': 10.0,
  'twelve': 12.0,
  'fifteen': 15.0,
  'twenty': 20.0,
  'thirty': 30.0,
  'forty': 40.0,
};

final _durationPattern = RegExp(
  r'\b(?<amount>\d+(?:[.,]\d+)?|half an?|half|'
  '${_numberWords.keys.join('|')})'
  r'\s*(?:(?:-|–|to)\s*\d+(?:[.,]\d+)?\s*)?'
  r'(?<unit>hours?|hrs?|minutes?|mins?|seconds?|secs?)\b',
);
