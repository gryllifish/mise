// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cook_timer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The cook mode timer of one recipe; null when none is set.
///
/// It keeps running while the cook moves between steps, so "simmer for
/// 20 minutes" can count down while they chop. Time comes from the clock,
/// not from counting ticks, so it stays right even if the OS pauses the
/// app.

@ProviderFor(CookTimerController)
final cookTimerControllerProvider = CookTimerControllerFamily._();

/// The cook mode timer of one recipe; null when none is set.
///
/// It keeps running while the cook moves between steps, so "simmer for
/// 20 minutes" can count down while they chop. Time comes from the clock,
/// not from counting ticks, so it stays right even if the OS pauses the
/// app.
final class CookTimerControllerProvider
    extends $NotifierProvider<CookTimerController, CookTimer?> {
  /// The cook mode timer of one recipe; null when none is set.
  ///
  /// It keeps running while the cook moves between steps, so "simmer for
  /// 20 minutes" can count down while they chop. Time comes from the clock,
  /// not from counting ticks, so it stays right even if the OS pauses the
  /// app.
  CookTimerControllerProvider._({
    required CookTimerControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cookTimerControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cookTimerControllerHash();

  @override
  String toString() {
    return r'cookTimerControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CookTimerController create() => CookTimerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CookTimer? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CookTimer?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CookTimerControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cookTimerControllerHash() =>
    r'2d104086bbb83e4f834c8a6034ff25fb96274ef4';

/// The cook mode timer of one recipe; null when none is set.
///
/// It keeps running while the cook moves between steps, so "simmer for
/// 20 minutes" can count down while they chop. Time comes from the clock,
/// not from counting ticks, so it stays right even if the OS pauses the
/// app.

final class CookTimerControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CookTimerController,
          CookTimer?,
          CookTimer?,
          CookTimer?,
          String
        > {
  CookTimerControllerFamily._()
    : super(
        retry: null,
        name: r'cookTimerControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The cook mode timer of one recipe; null when none is set.
  ///
  /// It keeps running while the cook moves between steps, so "simmer for
  /// 20 minutes" can count down while they chop. Time comes from the clock,
  /// not from counting ticks, so it stays right even if the OS pauses the
  /// app.

  CookTimerControllerProvider call(String recipeId) =>
      CookTimerControllerProvider._(argument: recipeId, from: this);

  @override
  String toString() => r'cookTimerControllerProvider';
}

/// The cook mode timer of one recipe; null when none is set.
///
/// It keeps running while the cook moves between steps, so "simmer for
/// 20 minutes" can count down while they chop. Time comes from the clock,
/// not from counting ticks, so it stays right even if the OS pauses the
/// app.

abstract class _$CookTimerController extends $Notifier<CookTimer?> {
  late final _$args = ref.$arg as String;
  String get recipeId => _$args;

  CookTimer? build(String recipeId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CookTimer?, CookTimer?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CookTimer?, CookTimer?>,
              CookTimer?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
