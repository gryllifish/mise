/// Loose, pure-Dart comparison of ingredient names as recipes write them:
/// case, punctuation and English plurals don't matter.
library;

/// Whether [a] and [b] name the same ingredient, or one is a more
/// specific kind of the other: "garlic" covers "minced garlic" and
/// "Chicken" covers "chicken breasts".
bool sameIngredient(String a, String b) {
  final wordsA = ingredientStems(a);
  final wordsB = ingredientStems(b);
  if (wordsA.isEmpty || wordsB.isEmpty) return false;
  return wordsA.every(wordsB.contains) || wordsB.every(wordsA.contains);
}

/// Words of [text], lower-cased and singular.
List<String> ingredientStems(String text) => [
  for (final word in text.toLowerCase().split(_nonLetters))
    if (word.isNotEmpty) stem(word),
];

/// Crude English singular: "tomatoes" -> "tomato", "berries" -> "berry".
String stem(String word) {
  if (word.endsWith('ies') && word.length > 4) {
    return '${word.substring(0, word.length - 3)}y';
  }
  if (word.endsWith('oes')) return word.substring(0, word.length - 2);
  if (word.endsWith('s') && !word.endsWith('ss')) {
    return word.substring(0, word.length - 1);
  }
  return word;
}

final _nonLetters = RegExp(r'[^\p{L}]+', unicode: true);
