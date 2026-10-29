import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/utils/async_pool.dart';

void main() {
  test('keeps the order of the inputs', () async {
    final results = await mapWithLimit(
      [3, 1, 2],
      (n) async {
        await Future<void>.delayed(Duration(milliseconds: n));
        return n * 10;
      },
      limit: 2,
    );

    expect(results, [30, 10, 20]);
  });

  test('never runs more than the limit at once', () async {
    var running = 0;
    var peak = 0;

    await mapWithLimit(List.generate(10, (i) => i), (_) async {
      running++;
      peak = running > peak ? running : peak;
      await Future<void>.delayed(Duration.zero);
      running--;
    }, limit: 3);

    expect(peak, 3);
  });

  test('rethrows the first error', () async {
    await expectLater(
      mapWithLimit([1, 2, 3], (n) async {
        if (n == 2) throw StateError('boom');
        return n;
      }, limit: 2),
      throwsStateError,
    );
  });

  test('handles an empty input', () async {
    expect(await mapWithLimit(<int>[], (n) async => n, limit: 4), isEmpty);
  });
}
