import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/utils/formatters.dart';

void main() {
  test('capitalized upper-cases only the first letter', () {
    expect(Formatters.capitalized('soy sauce'), 'Soy sauce');
    expect(Formatters.capitalized('Rice'), 'Rice');
    expect(Formatters.capitalized(''), '');
  });

  test('twoDigits pads single digits', () {
    expect(Formatters.twoDigits(3), '03');
    expect(Formatters.twoDigits(12), '12');
  });

  test('countdown shows minutes and seconds, and hours when needed', () {
    expect(
      Formatters.countdown(const Duration(minutes: 9, seconds: 5)),
      '9:05',
    );
    expect(Formatters.countdown(const Duration(seconds: 42)), '0:42');
    expect(
      Formatters.countdown(const Duration(hours: 1, minutes: 2)),
      '1:02:00',
    );
  });

  test('shortMeasure abbreviates units and keeps the rest', () {
    expect(Formatters.shortMeasure('1 tablespoon'), '1 tbsp');
    expect(Formatters.shortMeasure('2 Tablespoons'), '2 tbsp');
    expect(Formatters.shortMeasure('1/2 teaspoon'), '1/2 tsp');
    expect(Formatters.shortMeasure('450 grams'), '450 g');
    expect(Formatters.shortMeasure('1 (12 oz.)'), '1 (12 oz.)');
    expect(Formatters.shortMeasure('3/4 cup'), '3/4 cup');
    expect(Formatters.shortMeasure('1 clove'), '1 clove');
  });

  test('shortDuration reads like speech', () {
    expect(Formatters.shortDuration(const Duration(minutes: 10)), '10 min');
    expect(Formatters.shortDuration(const Duration(hours: 1)), '1 h');
    expect(
      Formatters.shortDuration(const Duration(hours: 1, minutes: 30)),
      '1 h 30 min',
    );
    expect(Formatters.shortDuration(const Duration(seconds: 45)), '45 s');
  });
}
