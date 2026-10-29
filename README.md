<img src="tool/icon/full.png" width="96" align="right" alt="Mise app icon: a scruffy white terrier in a chef's hat, with one blue eye and one brown">

# Mise

[![CI](https://github.com/gryllifish/mise/actions/workflows/ci.yml/badge.svg)](https://github.com/gryllifish/mise/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A Flutter recipe app on [TheMealDB](https://www.themealdb.com): browse,
search, save recipes for offline use, cook step by step, and find dishes
for the ingredients you have.

[Live demo](https://gryllifish.github.io/mise/) (web build; on a desktop it
opens inside a phone frame).

| Discover | Recipe | Cook mode | What I have |
|:---:|:---:|:---:|:---:|
| <img src="docs/screenshots/discover.png" width="200" alt="Discover: today's pick, search, and categories or countries"> | <img src="docs/screenshots/detail.png" width="200" alt="Recipe detail with photo, ingredients and method"> | <img src="docs/screenshots/cook.png" width="200" alt="Cook mode step with the ingredients it uses and a timer"> | <img src="docs/screenshots/pantry.png" width="200" alt="Recipes ranked by the ingredients in the pantry"> |

## Features
- Discover: a random recipe of the day, search, and browsing by category
  or by country.
- Recipe detail with ingredients and method; saved recipes are kept on
  the device and open offline.
- Cook mode: one step per page, the ingredients each step mentions, and a
  timer when a step names a duration.
- What I have: add ingredients you have at home and get recipes grouped
  by how much is missing.
- English and Spanish.

## Notes
Decisions that aren't obvious from the code alone.

- **Ranking by pantry happens on the client.** The free API key only
  filters by one ingredient per request, so the app queries each
  ingredient (plus catalog variants such as "Egg"/"Eggs"), ranks recipes
  by how many they use, and looks up the top 12 to compute what's
  missing. Requests run at most four at a time, since TheMealDB answers
  bursts with 429.
- **Search cancels superseded requests.** Each keystroke rebuilds the
  search provider after a 350 ms debounce; disposing the old one cancels
  its request, so a slow response can't replace a newer one. Dio stays in
  the data layer; cancellation crosses layers as a plain `CancelSignal`.
- **Storage has a timeout.** Some browsers leave IndexedDB open requests
  pending forever, which would block startup. Hive boxes open with a 4 s
  timeout and fall back to memory.
- **No shell route.** Every page is on the root navigator because a
  `Hero` only flies within one navigator, and recipe photos open from all
  three tabs. Bottom bars follow the route animations so they don't
  overlap during transitions.
- **Cook mode data is derived.** Recipes come as free text. Steps are
  split from the instructions, matched against the ingredient list, and
  scanned for durations ("10-15 minutes", "half an hour") in pure Dart
  ([`cook_step.dart`](lib/features/recipes/domain/entities/cook_step.dart)).
  The timer computes remaining time from the clock, so it stays correct
  if the OS suspends the app.
- **Countries are a fixed list.** The API lists 192 cuisines but only 29
  had recipes when checked; querying all of them on launch would hit the
  rate limit ([`known_cuisines.dart`](lib/features/recipes/data/datasources/known_cuisines.dart)).
- **Images:** `cached_network_image` on mobile; plain `NetworkImage` on the
  web, where the browser caches and the package's web loader could hang.

## Architecture
```
presentation → controllers → domain ← data
```
Riverpod 3 with code generation, go_router, freezed and
json_serializable, Dio, Hive. Data sources throw `AppException`;
repositories return `Result<T>`; the UI shows localized `Failure`
messages, and transient failures are retried with backoff.

```
lib/
├── app/        App widget, bootstrap, router
├── core/       config, constants, error, l10n, network, router, theme, utils
├── shared/     cross-feature providers and widgets
└── features/
    └── recipes/{data,domain,controllers,presentation}
```

## Running it
Requires Flutter 3.47+.

```sh
flutter pub get
flutter run
```

TheMealDB's public test key is the default. To use another base URL, copy
`env/dev.json.example` to `env/dev.json` and run with
`--dart-define-from-file=env/dev.json`. Generated code is committed; after
changing annotated classes or ARB files, run
`dart run build_runner build --delete-conflicting-outputs`.

## Tests
`scripts/verify.sh` runs pub get, codegen, l10n, format, analyze and the
tests; CI runs it on every push and PR, fails on stale generated files,
and deploys the web demo from `main`.

Unit tests cover step parsing, pantry ranking, data sources (a fake HTTP
adapter with recorded API responses, Hive in a temp dir), repositories
and controllers (debounce and timer with `fake_async`). Widget tests run
the app with fake repositories.

## App icon
Drawn from the author's dog by
[`tool/icon/generate_svg.py`](tool/icon/generate_svg.py);
[`tool/icon/render.sh`](tool/icon/render.sh) renders the launcher icons and
launch screens.

## Credits and license
Recipes and photos from [TheMealDB](https://www.themealdb.com). Fraunces
and Inter are bundled under the SIL Open Font License. Code under the
[MIT License](LICENSE).
