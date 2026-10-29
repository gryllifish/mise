import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mise/shared/providers/clock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cook_timer_controller.freezed.dart';
part 'cook_timer_controller.g.dart';

/// A countdown started from a cook mode step.
@freezed
abstract class CookTimer with _$CookTimer {
  const factory CookTimer({
    /// Index of the step that started it.
    required int stepIndex,
    required Duration total,
    required Duration remaining,
    required bool isRunning,
  }) = _CookTimer;

  const CookTimer._();

  bool get isDone => remaining == Duration.zero;
}

/// The cook mode timer of one recipe; null when none is set.
///
/// It keeps running while the cook moves between steps, so "simmer for
/// 20 minutes" can count down while they chop. Time comes from the clock,
/// not from counting ticks, so it stays right even if the OS pauses the
/// app.
@riverpod
class CookTimerController extends _$CookTimerController {
  static const _tick = Duration(seconds: 1);

  Timer? _ticker;
  DateTime? _endsAt;

  @override
  CookTimer? build(String recipeId) {
    ref.onDispose(() => _ticker?.cancel());
    return null;
  }

  /// Starts counting down [duration] for step [stepIndex], replacing any
  /// timer already set.
  void start(int stepIndex, Duration duration) {
    state = CookTimer(
      stepIndex: stepIndex,
      total: duration,
      remaining: duration,
      isRunning: true,
    );
    _run(duration);
  }

  void pause() {
    final timer = state;
    if (timer == null || !timer.isRunning) return;
    _stopTicking();
    state = timer.copyWith(remaining: _remaining(), isRunning: false);
  }

  void resume() {
    final timer = state;
    if (timer == null || timer.isRunning || timer.isDone) return;
    state = timer.copyWith(isRunning: true);
    _run(timer.remaining);
  }

  /// Clears the timer, finished or not.
  void stop() {
    _stopTicking();
    state = null;
  }

  void _run(Duration remaining) {
    _stopTicking();
    _endsAt = ref.read(clockProvider)().add(remaining);
    _ticker = Timer.periodic(_tick, (_) => _update());
  }

  void _update() {
    final timer = state;
    if (timer == null) return;
    final remaining = _remaining();
    if (remaining == Duration.zero) {
      _stopTicking();
      state = timer.copyWith(remaining: Duration.zero, isRunning: false);
    } else {
      state = timer.copyWith(remaining: remaining);
    }
  }

  Duration _remaining() {
    final endsAt = _endsAt;
    if (endsAt == null) return state?.remaining ?? Duration.zero;
    final left = endsAt.difference(ref.read(clockProvider)());
    // Rounded up, so "0:01" shows for the whole last second.
    final seconds = (left.inMilliseconds / Duration.millisecondsPerSecond)
        .ceil();
    return seconds <= 0 ? Duration.zero : Duration(seconds: seconds);
  }

  void _stopTicking() {
    _ticker?.cancel();
    _ticker = null;
    _endsAt = null;
  }
}
