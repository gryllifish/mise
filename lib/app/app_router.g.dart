// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Lives in `app/` (not `core/`) because it imports every feature's screens;
/// `core` must never depend on features.
///
/// Every route sits on the root navigator, without a shell: a `Hero` only
/// flies between pages of the same navigator, and recipe photos fly from
/// both tabs into the detail screen.

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

/// Lives in `app/` (not `core/`) because it imports every feature's screens;
/// `core` must never depend on features.
///
/// Every route sits on the root navigator, without a shell: a `Hero` only
/// flies between pages of the same navigator, and recipe photos fly from
/// both tabs into the detail screen.

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Lives in `app/` (not `core/`) because it imports every feature's screens;
  /// `core` must never depend on features.
  ///
  /// Every route sits on the root navigator, without a shell: a `Hero` only
  /// flies between pages of the same navigator, and recipe photos fly from
  /// both tabs into the detail screen.
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'5448b52e21803eac5a87ff6730a91d2c800a0b35';
