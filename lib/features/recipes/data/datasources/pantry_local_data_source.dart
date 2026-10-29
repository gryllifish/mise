import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pantry_local_data_source.g.dart';

/// Keeps the user's pantry on the device as one JSON list of names, in the
/// order they were added.
class PantryLocalDataSource {
  const PantryLocalDataSource(this._box);

  static const boxName = 'pantry';
  static const _key = 'ingredients';

  final Box<String> _box;

  /// Throws [StorageException] or [ParsingException].
  List<String> read() {
    final String? value;
    try {
      value = _box.get(_key);
      // Hive reports I/O and closed-box problems as HiveError.
      // ignore: avoid_catching_errors
    } on HiveError catch (error) {
      throw StorageException('Pantry unavailable', cause: error);
    }
    if (value == null) return const [];
    try {
      return (jsonDecode(value) as List<dynamic>).cast<String>().toList();
    } on Object catch (error) {
      throw ParsingException('Corrupted pantry', cause: error);
    }
  }

  /// Throws [StorageException].
  Future<void> write(List<String> ingredients) async {
    try {
      await _box.put(_key, jsonEncode(ingredients));
      // Hive writes fail asynchronously, with a HiveError.
      // ignore: avoid_catching_errors
    } on HiveError catch (error) {
      throw StorageException('Pantry unavailable', cause: error);
    }
  }
}

/// The opened Hive box. `bootstrap` opens it and overrides this provider;
/// tests override it with their own box.
@Riverpod(keepAlive: true)
Box<String> pantryBox(Ref ref) =>
    throw UnimplementedError('Override pantryBoxProvider at startup');

@riverpod
PantryLocalDataSource pantryLocalDataSource(Ref ref) =>
    PantryLocalDataSource(ref.watch(pantryBoxProvider));
