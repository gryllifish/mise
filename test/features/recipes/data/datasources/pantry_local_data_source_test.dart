import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/features/recipes/data/datasources/pantry_local_data_source.dart';

void main() {
  late Directory directory;
  late Box<String> box;
  late PantryLocalDataSource dataSource;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('mise_pantry_');
    Hive.init(directory.path);
    box = await Hive.openBox<String>(PantryLocalDataSource.boxName);
    dataSource = PantryLocalDataSource(box);
  });

  tearDown(() async {
    await Hive.close();
    await directory.delete(recursive: true);
  });

  test('starts empty', () {
    expect(dataSource.read(), isEmpty);
  });

  test('keeps the order it was written in, across reopening', () async {
    await dataSource.write(['Rice', 'Garlic', 'Eggs']);
    await box.close();
    final reopened = await Hive.openBox<String>(PantryLocalDataSource.boxName);

    expect(PantryLocalDataSource(reopened).read(), ['Rice', 'Garlic', 'Eggs']);
  });

  test('a corrupted value throws ParsingException', () async {
    await box.put('ingredients', '{"not": "a list"}');

    expect(dataSource.read, throwsA(isA<ParsingException>()));
  });

  test('a closed box throws StorageException', () async {
    await box.close();

    expect(dataSource.read, throwsA(isA<StorageException>()));
    await expectLater(
      dataSource.write(['Rice']),
      throwsA(isA<StorageException>()),
    );
  });
}
