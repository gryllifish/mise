import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/features/recipes/controllers/cook_timer_controller.dart';
import 'package:mise/shared/providers/clock_provider.dart';

void main() {
  final provider = cookTimerControllerProvider('1');

  /// Runs [body] with a container whose clock follows fake time.
  void withTimer(
    void Function(FakeAsync async, ProviderContainer container) body,
  ) => fakeAsync((async) {
    final start = DateTime(2026, 10, 28, 12);
    final container = ProviderContainer.test(
      overrides: [
        clockProvider.overrideWithValue(() => start.add(async.elapsed)),
      ],
    )..listen(provider, (_, _) {});
    body(async, container);
  });

  test('starts with no timer', () {
    withTimer((async, container) {
      expect(container.read(provider), isNull);
    });
  });

  test('counts down every second until done', () {
    withTimer((async, container) {
      container.read(provider.notifier).start(2, const Duration(seconds: 3));
      expect(
        container.read(provider),
        const CookTimer(
          stepIndex: 2,
          total: Duration(seconds: 3),
          remaining: Duration(seconds: 3),
          isRunning: true,
        ),
      );

      async.elapse(const Duration(seconds: 1));
      expect(container.read(provider)?.remaining, const Duration(seconds: 2));

      async.elapse(const Duration(seconds: 2));
      final done = container.read(provider);
      expect(done?.isDone, isTrue);
      expect(done?.isRunning, isFalse);

      async.elapse(const Duration(seconds: 5));
      expect(container.read(provider)?.remaining, Duration.zero);
    });
  });

  test('pause freezes the countdown and resume continues it', () {
    withTimer((async, container) {
      final timer = container.read(provider.notifier)
        ..start(0, const Duration(minutes: 1));
      async.elapse(const Duration(seconds: 10));

      timer.pause();
      async.elapse(const Duration(minutes: 5));
      expect(container.read(provider)?.remaining, const Duration(seconds: 50));
      expect(container.read(provider)?.isRunning, isFalse);

      timer.resume();
      async.elapse(const Duration(seconds: 20));
      expect(container.read(provider)?.remaining, const Duration(seconds: 30));
    });
  });

  test('stop clears it, and a new start replaces the old one', () {
    withTimer((async, container) {
      final timer = container.read(provider.notifier)
        ..start(0, const Duration(minutes: 1))
        ..start(3, const Duration(seconds: 5));
      expect(container.read(provider)?.stepIndex, 3);

      timer.stop();
      async.elapse(const Duration(seconds: 10));
      expect(container.read(provider), isNull);
    });
  });
}
