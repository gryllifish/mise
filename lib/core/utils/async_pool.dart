/// Runs [task] on every item of [items] with at most [limit] running at
/// once, and returns the results in the order of [items].
///
/// Like `Future.wait`, the first error is rethrown, after every task that
/// already started has finished.
Future<List<R>> mapWithLimit<T, R>(
  Iterable<T> items,
  Future<R> Function(T item) task, {
  required int limit,
}) async {
  assert(limit > 0, 'limit must be positive');
  final inputs = items.toList();
  final results = List<R?>.filled(inputs.length, null);
  var next = 0;

  Future<void> worker() async {
    while (next < inputs.length) {
      final index = next++;
      results[index] = await task(inputs[index]);
    }
  }

  await Future.wait([
    for (var i = 0; i < limit && i < inputs.length; i++) worker(),
  ]);
  return results.cast<R>();
}
