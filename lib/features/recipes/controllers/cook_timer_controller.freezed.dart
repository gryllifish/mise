// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cook_timer_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CookTimer {

/// Index of the step that started it.
 int get stepIndex; Duration get total; Duration get remaining; bool get isRunning;
/// Create a copy of CookTimer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookTimerCopyWith<CookTimer> get copyWith => _$CookTimerCopyWithImpl<CookTimer>(this as CookTimer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookTimer&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.total, total) || other.total == total)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning));
}


@override
int get hashCode => Object.hash(runtimeType,stepIndex,total,remaining,isRunning);

@override
String toString() {
  return 'CookTimer(stepIndex: $stepIndex, total: $total, remaining: $remaining, isRunning: $isRunning)';
}


}

/// @nodoc
abstract mixin class $CookTimerCopyWith<$Res>  {
  factory $CookTimerCopyWith(CookTimer value, $Res Function(CookTimer) _then) = _$CookTimerCopyWithImpl;
@useResult
$Res call({
 int stepIndex, Duration total, Duration remaining, bool isRunning
});




}
/// @nodoc
class _$CookTimerCopyWithImpl<$Res>
    implements $CookTimerCopyWith<$Res> {
  _$CookTimerCopyWithImpl(this._self, this._then);

  final CookTimer _self;
  final $Res Function(CookTimer) _then;

/// Create a copy of CookTimer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepIndex = null,Object? total = null,Object? remaining = null,Object? isRunning = null,}) {
  return _then(_self.copyWith(
stepIndex: null == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Duration,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CookTimer].
extension CookTimerPatterns on CookTimer {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookTimer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookTimer() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookTimer value)  $default,){
final _that = this;
switch (_that) {
case _CookTimer():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookTimer value)?  $default,){
final _that = this;
switch (_that) {
case _CookTimer() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepIndex,  Duration total,  Duration remaining,  bool isRunning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookTimer() when $default != null:
return $default(_that.stepIndex,_that.total,_that.remaining,_that.isRunning);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepIndex,  Duration total,  Duration remaining,  bool isRunning)  $default,) {final _that = this;
switch (_that) {
case _CookTimer():
return $default(_that.stepIndex,_that.total,_that.remaining,_that.isRunning);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepIndex,  Duration total,  Duration remaining,  bool isRunning)?  $default,) {final _that = this;
switch (_that) {
case _CookTimer() when $default != null:
return $default(_that.stepIndex,_that.total,_that.remaining,_that.isRunning);case _:
  return null;

}
}

}

/// @nodoc


class _CookTimer extends CookTimer {
  const _CookTimer({required this.stepIndex, required this.total, required this.remaining, required this.isRunning}): super._();
  

/// Index of the step that started it.
@override final  int stepIndex;
@override final  Duration total;
@override final  Duration remaining;
@override final  bool isRunning;

/// Create a copy of CookTimer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookTimerCopyWith<_CookTimer> get copyWith => __$CookTimerCopyWithImpl<_CookTimer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookTimer&&(identical(other.stepIndex, stepIndex) || other.stepIndex == stepIndex)&&(identical(other.total, total) || other.total == total)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning));
}


@override
int get hashCode => Object.hash(runtimeType,stepIndex,total,remaining,isRunning);

@override
String toString() {
  return 'CookTimer(stepIndex: $stepIndex, total: $total, remaining: $remaining, isRunning: $isRunning)';
}


}

/// @nodoc
abstract mixin class _$CookTimerCopyWith<$Res> implements $CookTimerCopyWith<$Res> {
  factory _$CookTimerCopyWith(_CookTimer value, $Res Function(_CookTimer) _then) = __$CookTimerCopyWithImpl;
@override @useResult
$Res call({
 int stepIndex, Duration total, Duration remaining, bool isRunning
});




}
/// @nodoc
class __$CookTimerCopyWithImpl<$Res>
    implements _$CookTimerCopyWith<$Res> {
  __$CookTimerCopyWithImpl(this._self, this._then);

  final _CookTimer _self;
  final $Res Function(_CookTimer) _then;

/// Create a copy of CookTimer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepIndex = null,Object? total = null,Object? remaining = null,Object? isRunning = null,}) {
  return _then(_CookTimer(
stepIndex: null == stepIndex ? _self.stepIndex : stepIndex // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Duration,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
