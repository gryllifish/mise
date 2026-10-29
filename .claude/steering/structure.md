# Structure

Feature-first, with layers inside each feature.

```
lib/
├── main.dart                 # Only calls bootstrap(App.new)
├── app/                      # App widget, bootstrap, GoRouter (imports features)
├── core/                     # Feature-agnostic; never imports features/ or app/
│   ├── config/               # Env (dart-defines)
│   ├── constants/            # AppDurations and other app-wide constants
│   ├── error/                # Failure, AppException, Result, guard
│   ├── l10n/                 # ARB files, generated code, context.l10n, failure messages
│   ├── network/              # Dio client + interceptors (when needed)
│   ├── router/               # Route path constants (AppRoutes)
│   ├── theme/                # Design tokens + ThemeData
│   └── utils/                # Logger, formatters, pure helpers
├── shared/
│   ├── providers/            # Cross-feature providers (clock, session)
│   └── widgets/              # Reusable widgets without business logic
└── features/<feature>/
    ├── data/
    │   ├── datasources/      # Talk to assets/APIs/storage; throw AppException
    │   ├── mappers/          # DTO -> entity extensions
    │   ├── models/           # DTOs (freezed + json_serializable)
    │   └── repositories/     # Implementations + their @riverpod providers
    ├── domain/
    │   ├── entities/         # Pure Dart business objects and rules
    │   └── repositories/     # Abstract interfaces
    ├── controllers/          # @riverpod Notifiers/AsyncNotifiers + state classes
    └── presentation/
        ├── screens/          # One per route
        └── widgets/          # Feature-specific widgets
test/                         # Mirrors lib/; shared fixtures in test/helpers/
```

Deviations from a textbook layout, on purpose:
- `data/mappers/` keeps DTO→entity mapping explicit and out of both models.
- The `GoRouter` lives in `app/` because it imports screens; `core/router/`
  only holds path constants, so `core` never depends on features.
- `core/config/` holds build-time environment config.

## Dependency rules
```
presentation → controllers → domain ← data
```
- `domain` imports only Dart, `freezed_annotation` and `core/error` +
  `core/utils` pure helpers. Never Flutter, Riverpod, Dio or `data`.
- `data` implements `domain` interfaces. It may use Flutter services
  (`AssetBundle`) and Riverpod (for its own providers).
- `controllers` depend on repository **providers** typed as the domain
  interface, never on data sources or implementations directly.
- `presentation` talks only to controllers/providers. Never to repositories
  or data sources.
- Features don't import each other's internals. Share through `shared/` or
  expose a provider.

## Naming
| Kind | File | Class |
|---|---|---|
| Entity | `client.dart` | `Client` |
| DTO | `client_dto.dart` | `ClientDto` |
| Mapper | `client_mapper.dart` | `extension ClientDtoMapper` |
| Repository interface | `clients_repository.dart` | `ClientsRepository` |
| Repository impl | `clients_repository_impl.dart` | `ClientsRepositoryImpl` |
| Data source | `clients_local_data_source.dart` | `ClientsLocalDataSource` |
| Controller | `clients_controller.dart` | `ClientsController` → `clientsControllerProvider` |
| Screen | `home_screen.dart` | `HomeScreen` |
| Test | `<file>_test.dart` mirroring the path in `lib/` | |

- Files: `snake_case.dart`. Classes/enums: `PascalCase`. Members:
  `lowerCamelCase`. Private widgets in the same file: `_PascalCase`.
- Use full words (`client`, not `cli`); booleans read as questions
  (`isHot`, `hasValue`).
