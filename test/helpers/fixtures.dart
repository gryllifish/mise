import 'dart:convert';
import 'dart:io';

/// Raw body of a recorded TheMealDB response in `test/fixtures/`.
String fixture(String name) =>
    File('test/fixtures/$name.json').readAsStringSync();

/// [fixture] decoded as a JSON object.
Map<String, dynamic> fixtureJson(String name) =>
    jsonDecode(fixture(name)) as Map<String, dynamic>;
