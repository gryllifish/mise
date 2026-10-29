# Tech stack

## Versions
- Flutter 3.44 (stable) / Dart 3.12. Material 3.
- Platforms: iOS, Android, Web.

## Packages
| Package | Why |
|---|---|
| `flutter_riverpod` + `riverpod_annotation` / `riverpod_generator` | State management and DI. Codegen (`@riverpod`) for less boilerplate and compile-time safety. |
| `freezed` + `freezed_annotation` | Immutable entities, DTOs and states with `copyWith`/`==`/unions. |
| `json_serializable` + `json_annotation` | DTO serialization. `build.yaml` sets `field_rename: snake`. |
| `go_router` | Declarative routing, exposed through a keep-alive provider. |
| `flutter_localizations` + `intl` | i18n via ARB files (`en`, `es`) and locale-aware formatting. |
| `google_fonts` | Typography (runtime-fetched; bundle the fonts before a production release). |
| `mocktail` (dev) | Mocks without codegen. |
| `very_good_analysis` (dev) | Strict lint set. |
| `build_runner` (dev) | Runs the generators. |

### Deliberately not added yet (YAGNI)
- **`dio`**: added with the first remote data source, wrapped in
  `core/network/`. Never used directly from controllers or widgets.
- **Native flavors**: `--dart-define-from-file` covers dev/staging/prod
  until per-flavor app ids or icons are needed.
- **Logger package**: `AppLogger` wraps `dart:developer`.
- **`fpdart`**: `Result` is a small sealed class in `core/error/`.

### Version pins
- `freezed` stays on `^3.2.5`: freezed 4 (stable) requires Dart ≥ 3.13.
  Upgrade freezed, `riverpod_generator` and `json_serializable` together
  after upgrading Flutter.

## Commands
```sh
scripts/verify.sh                       # Definition of Done gate (prefer this)
flutter run --dart-define-from-file=env/dev.json
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs
flutter gen-l10n                        # also runs on pub get / run
flutter analyze
flutter test
dart format lib test
```

## Environments
- `env/<env>.json` (git-ignored) holds `APP_ENV` and `API_BASE_URL`; copy
  from `env/dev.json.example`. Read them only through `core/config/env.dart`.
- Never commit secrets. Anything shipped in the binary is not secret anyway.

## Generated code
`*.g.dart`, `*.freezed.dart` and `lib/core/l10n/generated/` **are
committed** so the repo runs right after cloning. `.gitattributes` marks
them `linguist-generated` (collapsed in GitHub diffs). They are excluded
from analysis and must never be edited by hand: change the source and
re-run codegen.
