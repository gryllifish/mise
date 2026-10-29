import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:mise/core/config/env.dart';
import 'package:mise/core/error/retry_policy.dart';
import 'package:mise/core/utils/app_logger.dart';
import 'package:mise/features/recipes/data/datasources/pantry_local_data_source.dart';
import 'package:mise/features/recipes/data/datasources/saved_recipes_local_data_source.dart';

/// Sets up error reporting, opens local storage and runs the app inside a
/// [ProviderScope].
Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    AppLogger.error('Flutter error', details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    AppLogger.error('Uncaught error', error, stackTrace);
    return true;
  };

  // Fonts ship in assets/google_fonts/, so never download them at runtime.
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(_fontLicenses);

  await _initStorage();
  final (savedRecipesBox, pantryBox) = await (
    _openBox(SavedRecipesLocalDataSource.boxName),
    _openBox(PantryLocalDataSource.boxName),
  ).wait;

  AppLogger.info('Starting app (${Env.environment.name})');
  runApp(
    ProviderScope(
      retry: retryPolicy,
      overrides: [
        savedRecipesBoxProvider.overrideWithValue(savedRecipesBox),
        pantryBoxProvider.overrideWithValue(pantryBox),
      ],
      child: builder(),
    ),
  );
}

/// Initializes Hive; a failure is logged, and [_openBox] then falls back.
Future<void> _initStorage() async {
  try {
    await Hive.initFlutter();
    // See _openBox.
    // ignore: avoid_catches_without_on_clauses
  } catch (error, stackTrace) {
    AppLogger.error('Local storage unavailable', error, stackTrace);
  }
}

/// The box called [name], on disk (IndexedDB on the web).
///
/// When storage fails or never answers (some browsers leave IndexedDB
/// hanging, e.g. in private windows), falls back to an in-memory box after
/// [_storageTimeout]: the app still starts, and changes last until it
/// closes.
Future<Box<String>> _openBox(String name) async {
  try {
    return await Hive.openBox<String>(name).timeout(_storageTimeout);
    // Hive reports storage problems as HiveError, an Error subclass, and
    // platform storage as exceptions; any of them must not stop the app.
    // ignore: avoid_catches_without_on_clauses
  } catch (error, stackTrace) {
    AppLogger.error('Storage for $name unavailable', error, stackTrace);
    // A distinct name: Hive would hand back the still-pending open instead.
    return Hive.openBox<String>('${name}_memory', bytes: Uint8List(0));
  }
}

const _storageTimeout = Duration(seconds: 4);

Stream<LicenseEntry> _fontLicenses() async* {
  for (final (family, file) in [
    ('Fraunces', 'OFL-Fraunces.txt'),
    ('Inter', 'OFL-Inter.txt'),
  ]) {
    final license = await rootBundle.loadString('assets/google_fonts/$file');
    yield LicenseEntryWithLineBreaks([family], license);
  }
}
