/// Pure display formatters. Widgets may call these directly.
abstract final class Formatters {
  static const _unitAbbreviations = {
    'tablespoon': 'tbsp',
    'tbsp': 'tbsp',
    'tbl': 'tbsp',
    'teaspoon': 'tsp',
    'tsp': 'tsp',
    'gram': 'g',
    'gr': 'g',
    'kilogram': 'kg',
    'millilitre': 'ml',
    'milliliter': 'ml',
    'litre': 'l',
    'liter': 'l',
    'ounce': 'oz',
    'pound': 'lb',
  };

  static final _units = RegExp(
    r'\b(tablespoons?|tbsps?|tbls?|teaspoons?|tsps?|grams?|gr|kilograms?|'
    r'millilit(?:re|er)s?|lit(?:re|er)s?|ounces?|pounds?)\b',
    caseSensitive: false,
  );

  /// First letter in upper case, e.g. "soy sauce" -> "Soy sauce".
  static String capitalized(String text) =>
      text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);

  /// Measure with its unit abbreviated, e.g. "1 tablespoon" -> "1 tbsp",
  /// "450 grams" -> "450 g".
  static String shortMeasure(String measure) => measure.replaceAllMapped(
    _units,
    (match) =>
        _unitAbbreviations[match[0]!.toLowerCase().replaceAll(
          RegExp(r's$'),
          '',
        )] ??
        match[0]!,
  );

  /// Short spoken duration, e.g. "10 min", "1 h", "1 h 30 min", "45 s".
  static String shortDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(Duration.minutesPerHour);
    if (hours == 0 && minutes == 0) return '${duration.inSeconds} s';
    return [
      if (hours > 0) '$hours h',
      if (minutes > 0) '$minutes min',
    ].join(' ');
  }

  /// Countdown clock, e.g. 9 min 5 s -> "9:05", 1 h 2 min -> "1:02:00".
  static String countdown(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(Duration.minutesPerHour);
    final seconds = twoDigits(
      duration.inSeconds.remainder(Duration.secondsPerMinute),
    );
    return hours > 0
        ? '$hours:${twoDigits(minutes)}:$seconds'
        : '$minutes:$seconds';
  }

  /// Zero-padded two-digit counter, e.g. 6 -> "06".
  static String twoDigits(int value) => value.toString().padLeft(2, '0');
}
