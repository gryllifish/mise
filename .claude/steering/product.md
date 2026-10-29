# Product

> Per-project file. Everything else in `.claude/steering/` is generic and can
> be copied to new projects unchanged.

## Purpose
Second portfolio demo (after Clientele): a recipe finder that showcases
what Clientele doesn't — a **real network API** with typed network errors
and retries, **offline persistence**, image caching, **debounced and
cancellable search**, and **gestures**. Polished, small, not a full app.

## Target audience
- Recruiters and engineers reviewing the GitHub repo and the live web demo.
- Secondary: the author, as a reusable architecture reference.

## Data source
TheMealDB, `https://www.themealdb.com/api/json/v1/1/` (public test key
"1", documented for development, not a secret; CORS allows the web demo).
Endpoints: `categories.php`, `filter.php?c=`, `search.php?s=`,
`lookup.php?i=`, `random.php`. Quirks handled in `data`:
- "No results" is `null`, not `[]`.
- Ingredients come as 20 numbered field pairs (`strIngredientN` /
  `strMeasureN`), folded into a list by `readIngredients`.
- Instructions are free-form text, split into steps by
  `splitInstructions` (lines, numbering, "STEP 1" headers, single
  paragraphs).
- No pagination: search returns ~25 results max, so there is no infinite
  scroll; browsing is by category instead.
- Photos accept `/medium` and `/small` suffixes; cards use `/medium`.

## Scope
### In scope
1. **Discover** (tab 1): "Today's pick" hero card (one random recipe per
   session); "Categories | Countries" switch over the chips (first one
   selected by default), recipe grid for the active category or cuisine;
   search field with 350 ms debounce that replaces the grid with results.
   Countries come from a curated list (`known_cuisines.dart`): of the 192
   areas TheMealDB lists, only 29 had recipes on 2026-10-28, and big ones
   (French, Indian, American, Peruvian, Argentine) have none tagged.
   Flags are emoji (Windows browsers show letters instead).
2. **Recipe detail** (`/recipes/:id`): photo flies in from the card with a
   `Hero`; title, category · area; ingredients as an editorial list
   (quantity column, then name; no checkboxes); method as numbered steps; save/unsave (heart); "Start
   cooking" button. When offline and saved, shows the saved copy with a
   small notice.
3. **Cook mode** (`/recipes/:id/cook`): immersive, story-style. The dish
   photo fills the screen, blurred (TheMealDB photos are 700px, too small
   to show sharp full screen), with a slow Ken Burns zoom that drifts per
   step; white story bars; big step text over it, anchored at the top so
   the step number never moves between steps; "You'll need" with cut-out
   photos and quantities of the ingredients the step mentions (TheMealDB
   ingredient images, matched by name); a timer when the step names a
   duration, which keeps counting across steps. Manual advance only
   (swipe, tap zones, buttons, arrow keys): a step takes minutes. TheMealDB
   has one photo per recipe and no per-step photos, so step visuals come
   from the ingredients.
4. **What I have** (tab 2, `/pantry`): the user lists ingredients they
   have (autocomplete over TheMealDB's 992-ingredient catalog, with
   photos; popular suggestions when empty), kept on the device. Recipes
   that use them, grouped "Ready to cook" / "Almost there" (1–2 missing) /
   "More ideas", each saying what's missing. Salt, pepper, water and oil
   never count as missing. Easy removal: tap a chip (48px), or "Clear
   all", both with undo. The free API filters by one ingredient at a
   time, so each pantry ingredient (and its catalog variants, "Egg" and
   "Eggs") is fetched separately and recipes are ranked by how many they
   use; the top 12 are looked up to compute what's missing.
5. **Saved** (tab 3): saved recipes, most recent first, available
   offline; empty state with a "Discover recipes" action.

### Out of scope
Accounts, backend, creating recipes, shopping lists, video playback.

## Design
No Figma: designed in code, deliberately different from Clientele.
Warm, editorial: cream paper background, Fraunces (serif) headings, Inter
body, large photos, tomato accent, olive/saffron secondary. Tokens in
`lib/core/theme/`. Three-tab bottom bar (Discover, What I have, Saved). On wide screens
the app sits in a phone frame (`app/phone_frame.dart`). Honors the OS
"Reduce motion" setting (`context.motion(...)`).

## Status
### Done
- Project created (`--org com.franpaez`, iOS/Android/web), template copied
  from Clientele (steering, skills, `verify.sh`, CI workflow with Pages
  deploy at `/mise/`, Dependabot, LICENSE, analysis options).
- Dependencies (approved): Clientele's set plus `dio`,
  `cached_network_image`, `hive_ce`, `hive_ce_flutter`; dev `fake_async`.
  Fraunces and Inter bundled in `assets/google_fonts/` with their OFL
  licenses.
- `core`: network failures/exceptions with `isTransient`, retry policy,
  `api_client.dart` (Dio factory + `mapDioException`), `CancelSignal`,
  theme tokens, l10n strings (en + es) for every screen above.
- `features/recipes`: entities (`Recipe`, `Ingredient`, `RecipeSummary`,
  `RecipeCategory`), repository interfaces, DTOs (`MealDto`,
  `MealSummaryDto`, `CategoryDto`, `SavedRecipeDto`), mappers, instructions
  parser, remote data source (Dio), saved data source (Hive `Box<String>`
  of JSON), repositories (with offline fallback to the saved copy),
  controllers (categories, active category, category recipes, today's
  pick, debounced search, recipe lookup, checked ingredients, saved
  recipes with optimistic toggle).
- Tests: core error/retry/network mapping; instructions parser and mappers
  (fixtures from the real API in `test/fixtures/`); remote data source
  (fake `HttpClientAdapter`: fixtures, error types, cancellation); saved
  data source (Hive in a temp dir); repositories (offline fallback only on
  transient failures); controllers (search debounce and cancellation with
  `fake_async`, optimistic save with rollback, default active category).
- `app/`: `App`, `bootstrap` (opens the Hive box, overrides
  `savedRecipesBoxProvider`; falls back to an in-memory box if storage
  fails or hangs for 4 s), `app_router.dart` with `AppRoutes`
  (`/`, `/saved`, `/recipes/:id`, `/recipes/:id/cook`). No shell route:
  every page sits on the root navigator so the Hero can fly from both
  tabs; Saved pushes the detail so back returns to it. `AppBottomNav`
  (two tabs). Screens are placeholders.
- Tests: router (tabs, deep link back stack, back to Saved) and phone
  frame, with `test/helpers/pump_app.dart` faking both repositories.
- Discover screen: header, debounced search (results, no results, error),
  today's pick card, category chips, staggered recipe grid, skeletons and
  per-section errors with retry. Discover providers are `keepAlive`, so
  tabs keep the query and category. `AppNetworkImage` via
  `imageLoaderProvider` (`NetworkImage` on web, where
  `cached_network_image` hangs; disk cache on mobile). Cards push the
  detail with a per-place Hero tag (`RecipeHeroTags`) as `extra`.
- Tests: Discover widget tests (pick, categories, search debounce, no
  results, clear, tab switch, open recipe, offline retry); `pumpApp`
  takes a `FakeRecipesRepository` with a settable `failure`.

- Detail: photo header with Hero (`RecipePreview` via route `extra`
  shows the photo and title before the lookup resolves), editorial
  ingredient list, numbered method, save heart, saved-copy notice, start
  cooking. Cook mode as in scope above: `CookStep` (domain) finds each
  step's ingredients and first duration; `CookTimerController` counts
  down from the clock (`clockProvider`), not from ticks; haptic + system
  chime when done; ingredients sheet. Saved: list, swipe to remove
  with undo (`confirmDismiss`, so failures slide back), empty state.
- What I have: `PantryRepository` (catalog, per-ingredient filter, Hive
  box `pantry` opened in `bootstrap`), `PantryController` (optimistic,
  undo via `restore`), `PantryMatchesController` (variants, ranking,
  lookups; `retry` refetches failed ingredients), domain matching in
  `ingredient_names.dart` and `pantry.dart`.
- Countries browse mode (`BrowseModeController`, `CuisinesController`,
  `cuisineRecipes`); chips generalized as `SelectionChips`.
- TheMealDB rate-limits bursts with 429: `ServerFailure` treats 429 and
  408 as transient (retried), and pantry matching runs at most 4 requests
  at once (`mapWithLimit` in `core/utils/async_pool.dart`).
- Tests: widget tests for detail, cook mode, Saved and What I have; `cook_step`
  matching and durations; timer controller with `fake_async`. Cook mode
  widget tests run with reduced motion (the zoom never settles).

- App icon: the author's scruffy white terrier in a chef's hat (pointed,
  drooping fur tufts, half-up pink ears with folded tips, beige brows,
  one blue eye and one brown) on tomato. `tool/icon/generate_svg.py` draws
  `mise.svg` (the tufts are generated); `tool/icon/render.sh` renders
  `full.png` and the Android adaptive `fg.png` with headless Chrome and
  runs `flutter_launcher_icons` (iOS, Android, web, favicon).

- Branded launch screens: tomato with the dog on Android (pre-12 layer
  list and 12+ splash API, color in `values/launch_colors.xml` so
  `flutter_launcher_icons` never overwrites it), iOS (storyboard color +
  `LaunchImage`) and web (icon on the backdrop until the first frame);
  images come from `tool/icon/render.sh`. Web title, description and
  manifest say Mise.
- README with screenshots (`docs/screenshots/`) and social preview
  (`docs/social_preview.png`, 1280×640). Clientele leftovers removed
  (unused formatters, `AppTopBar`, `recipeCount`, two durations).

### Next steps, in order
1. Check motion with `flutter run` on a phone (Hero flights, staggered
   grid, page transitions, cook mode swipes, bottom bar hand-over).
2. `git init`, private GitHub repo `gryllifish/mise`, enable Pages
   (`build_type=workflow`), secret scanning, Dependabot alerts, ruleset
   protecting `main`; upload the social preview; later make it public.
3. Optional: GIFs for the README (simulator recordings), Spanish names
   for ingredients, categories and countries.

## Success criteria
- Animations run at 60 fps on a mid-range phone.
- `scripts/verify.sh` passes; CI green; live web demo on GitHub Pages.
- Every network failure has a clear message and a working retry.
