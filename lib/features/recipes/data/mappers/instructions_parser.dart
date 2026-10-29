/// Splits TheMealDB's free-form instructions into one action per step.
///
/// Authors write them in many shapes: one paragraph per line, numbered
/// lines, "STEP 1" headers on their own line, or a single wall of text.
List<String> splitInstructions(String? raw) {
  final lines = (raw ?? '')
      .split(RegExp(r'\r?\n'))
      .map((line) => line.replaceFirst(_stepPrefix, '').trim())
      .where((line) => line.isNotEmpty && !_headerOnly.hasMatch(line))
      .toList();

  // A single block of text reads better as one sentence per step.
  if (lines.length == 1) {
    return lines.single
        .split(_sentenceEnd)
        .map((sentence) => sentence.trim())
        .where((sentence) => sentence.isNotEmpty)
        .toList();
  }
  return lines;
}

/// "1. ", "2) ", "Step 3: ", "STEP 4 - " at the start of a line.
final _stepPrefix = RegExp(
  r'^\s*(?:step\s*\d+\s*[:.)-]?|\d+\s*[.)])\s*',
  caseSensitive: false,
);

/// Lines that are only a step label or number, e.g. "STEP 1" or "2".
final _headerOnly = RegExp(r'^(?:step\s*)?\d+[:.)]?$', caseSensitive: false);

/// End of a sentence followed by the start of the next one.
final _sentenceEnd = RegExp(r'(?<=[.!?])\s+(?=[A-Z])');
