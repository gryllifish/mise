import 'dart:async';

import 'package:google_fonts/google_fonts.dart';

/// Runs before every test file. Tests have no network, so fonts must come
/// from the bundled assets.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await testMain();
}
