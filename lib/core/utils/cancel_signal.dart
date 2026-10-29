import 'dart:async';

/// A framework-free way to tell a running request that its result is no
/// longer wanted, so layers above `data` never depend on Dio's CancelToken.
class CancelSignal {
  final _completer = Completer<void>();

  bool get isCancelled => _completer.isCompleted;

  /// Completes once [cancel] is called.
  Future<void> get whenCancelled => _completer.future;

  void cancel() {
    if (!isCancelled) _completer.complete();
  }
}
