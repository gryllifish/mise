import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/features/recipes/data/models/saved_recipe_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_recipes_local_data_source.g.dart';

/// Keeps saved recipes on the device as JSON strings keyed by recipe id.
///
/// Hive works the same on mobile and on the web (IndexedDB), so saved
/// recipes are available offline everywhere.
class SavedRecipesLocalDataSource {
  const SavedRecipesLocalDataSource(this._box);

  static const boxName = 'saved_recipes';

  final Box<String> _box;

  /// Throws [StorageException] or [ParsingException].
  List<SavedRecipeDto> readAll() {
    final values = _storage(() => _box.values.toList());
    return [for (final value in values) _decode(value)];
  }

  /// Throws [StorageException] or [ParsingException].
  SavedRecipeDto? read(String id) => switch (_storage(() => _box.get(id))) {
    final String value => _decode(value),
    null => null,
  };

  /// Throws [StorageException].
  Future<void> write(SavedRecipeDto recipe) =>
      _storageAsync(() => _box.put(recipe.id, jsonEncode(recipe.toJson())));

  /// Throws [StorageException].
  Future<void> delete(String id) => _storageAsync(() => _box.delete(id));

  SavedRecipeDto _decode(String value) {
    try {
      return SavedRecipeDto.fromJson(
        jsonDecode(value) as Map<String, dynamic>,
      );
    } on Object catch (error) {
      throw ParsingException('Corrupted saved recipe', cause: error);
    }
  }

  T _storage<T>(T Function() action) {
    try {
      return action();
      // Hive reports I/O and closed-box problems as HiveError, an Error
      // subclass, so it has to be caught here to stay a typed failure.
      // ignore: avoid_catching_errors
    } on HiveError catch (error) {
      throw StorageException('Saved recipes unavailable', cause: error);
    }
  }

  /// Like [_storage], but also catches errors thrown inside the returned
  /// future: Hive's writes fail asynchronously.
  Future<void> _storageAsync(Future<void> Function() action) async {
    try {
      await action();
      // See _storage.
      // ignore: avoid_catching_errors
    } on HiveError catch (error) {
      throw StorageException('Saved recipes unavailable', cause: error);
    }
  }
}

/// The opened Hive box. Opening is async, so `bootstrap` opens it and
/// overrides this provider; tests override it with their own box.
@Riverpod(keepAlive: true)
Box<String> savedRecipesBox(Ref ref) =>
    throw UnimplementedError('Override savedRecipesBoxProvider at startup');

@riverpod
SavedRecipesLocalDataSource savedRecipesLocalDataSource(Ref ref) =>
    SavedRecipesLocalDataSource(ref.watch(savedRecipesBoxProvider));
