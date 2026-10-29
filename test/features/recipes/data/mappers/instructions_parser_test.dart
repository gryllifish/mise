import 'package:flutter_test/flutter_test.dart';
import 'package:mise/features/recipes/data/mappers/instructions_parser.dart';

void main() {
  test('one step per non-empty line', () {
    expect(splitInstructions('Boil water.\r\n\r\nAdd pasta.\nDrain.'), [
      'Boil water.',
      'Add pasta.',
      'Drain.',
    ]);
  });

  test('drops numbering and step headers', () {
    expect(
      splitInstructions(
        'STEP 1\r\nChop onions.\r\nStep 2: Fry them.\r\n3. Serve.',
      ),
      ['Chop onions.', 'Fry them.', 'Serve.'],
    );
  });

  test('splits a single paragraph into sentences', () {
    expect(splitInstructions('Mix it. Bake for 20 min. Enjoy!'), [
      'Mix it.',
      'Bake for 20 min.',
      'Enjoy!',
    ]);
  });

  test('keeps decimals and temperatures intact', () {
    expect(splitInstructions('Heat to 180C. Use 1.5 cups.'), [
      'Heat to 180C.',
      'Use 1.5 cups.',
    ]);
  });

  test('null or blank instructions give no steps', () {
    expect(splitInstructions(null), isEmpty);
    expect(splitInstructions('  \r\n '), isEmpty);
  });
}
