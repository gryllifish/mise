import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/features/recipes/data/datasources/saved_recipes_local_data_source.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';

import '../../../../helpers/recipe_fixtures.dart';

void main() {
  late Directory directory;
  late Box<String> box;
  late SavedRecipesLocalDataSource dataSource;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('mise_hive_');
    Hive.init(directory.path);
    box = await Hive.openBox<String>(SavedRecipesLocalDataSource.boxName);
    dataSource = SavedRecipesLocalDataSource(box);
  });

  tearDown(() async {
    await Hive.close();
    await directory.delete(recursive: true);
  });

  final first = buildRecipe(id: '1').toSavedDto(savedAt: DateTime(2026));
  final second = buildRecipe(id: '2').toSavedDto(savedAt: DateTime(2026, 2));

  test('a written recipe reads back unchanged', () async {
    await dataSource.write(first);

    expect(dataSource.read('1'), first);
  });

  test('reading an unknown id returns null', () {
    expect(dataSource.read('missing'), isNull);
  });

  test('readAll returns every saved recipe', () async {
    await dataSource.write(first);
    await dataSource.write(second);

    expect(dataSource.readAll(), unorderedEquals([first, second]));
  });

  test('writing the same id again replaces the copy', () async {
    await dataSource.write(first);
    final renamed = first.copyWith(name: 'Renamed');
    await dataSource.write(renamed);

    expect(dataSource.readAll(), [renamed]);
  });

  test('delete removes the recipe', () async {
    await dataSource.write(first);
    await dataSource.delete('1');

    expect(dataSource.read('1'), isNull);
  });

  test('survives reopening the box', () async {
    await dataSource.write(first);
    await box.close();
    final reopened = await Hive.openBox<String>(
      SavedRecipesLocalDataSource.boxName,
    );

    expect(SavedRecipesLocalDataSource(reopened).read('1'), first);
  });

  test('a corrupted entry throws ParsingException', () async {
    await box.put('1', 'not json');

    expect(() => dataSource.read('1'), throwsA(isA<ParsingException>()));
    expect(dataSource.readAll, throwsA(isA<ParsingException>()));
  });

  group('a closed box throws StorageException', () {
    setUp(() => box.close());

    test('on read', () {
      expect(dataSource.readAll, throwsA(isA<StorageException>()));
    });

    test('on write', () async {
      await expectLater(
        dataSource.write(first),
        throwsA(isA<StorageException>()),
      );
    });

    test('on delete', () async {
      await expectLater(
        dataSource.delete('1'),
        throwsA(isA<StorageException>()),
      );
    });
  });
}
