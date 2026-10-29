// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cook_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CookStep {

 String get text;/// Ingredients the step mentions, in recipe order.
 List<Ingredient> get ingredients;/// The first duration the step mentions ("simmer for 10 minutes"),
/// offered as a timer.
 Duration? get timer;
/// Create a copy of CookStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookStepCopyWith<CookStep> get copyWith => _$CookStepCopyWithImpl<CookStep>(this as CookStep, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookStep&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&(identical(other.timer, timer) || other.timer == timer));
}


@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(ingredients),timer);

@override
String toString() {
  return 'CookStep(text: $text, ingredients: $ingredients, timer: $timer)';
}


}

/// @nodoc
abstract mixin class $CookStepCopyWith<$Res>  {
  factory $CookStepCopyWith(CookStep value, $Res Function(CookStep) _then) = _$CookStepCopyWithImpl;
@useResult
$Res call({
 String text, List<Ingredient> ingredients, Duration? timer
});




}
/// @nodoc
class _$CookStepCopyWithImpl<$Res>
    implements $CookStepCopyWith<$Res> {
  _$CookStepCopyWithImpl(this._self, this._then);

  final CookStep _self;
  final $Res Function(CookStep) _then;

/// Create a copy of CookStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? ingredients = null,Object? timer = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,timer: freezed == timer ? _self.timer : timer // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [CookStep].
extension CookStepPatterns on CookStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookStep value)  $default,){
final _that = this;
switch (_that) {
case _CookStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookStep value)?  $default,){
final _that = this;
switch (_that) {
case _CookStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<Ingredient> ingredients,  Duration? timer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookStep() when $default != null:
return $default(_that.text,_that.ingredients,_that.timer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<Ingredient> ingredients,  Duration? timer)  $default,) {final _that = this;
switch (_that) {
case _CookStep():
return $default(_that.text,_that.ingredients,_that.timer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<Ingredient> ingredients,  Duration? timer)?  $default,) {final _that = this;
switch (_that) {
case _CookStep() when $default != null:
return $default(_that.text,_that.ingredients,_that.timer);case _:
  return null;

}
}

}

/// @nodoc


class _CookStep implements CookStep {
  const _CookStep({required this.text, required final  List<Ingredient> ingredients, this.timer}): _ingredients = ingredients;
  

@override final  String text;
/// Ingredients the step mentions, in recipe order.
 final  List<Ingredient> _ingredients;
/// Ingredients the step mentions, in recipe order.
@override List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

/// The first duration the step mentions ("simmer for 10 minutes"),
/// offered as a timer.
@override final  Duration? timer;

/// Create a copy of CookStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookStepCopyWith<_CookStep> get copyWith => __$CookStepCopyWithImpl<_CookStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookStep&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&(identical(other.timer, timer) || other.timer == timer));
}


@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_ingredients),timer);

@override
String toString() {
  return 'CookStep(text: $text, ingredients: $ingredients, timer: $timer)';
}


}

/// @nodoc
abstract mixin class _$CookStepCopyWith<$Res> implements $CookStepCopyWith<$Res> {
  factory _$CookStepCopyWith(_CookStep value, $Res Function(_CookStep) _then) = __$CookStepCopyWithImpl;
@override @useResult
$Res call({
 String text, List<Ingredient> ingredients, Duration? timer
});




}
/// @nodoc
class __$CookStepCopyWithImpl<$Res>
    implements _$CookStepCopyWith<$Res> {
  __$CookStepCopyWithImpl(this._self, this._then);

  final _CookStep _self;
  final $Res Function(_CookStep) _then;

/// Create a copy of CookStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? ingredients = null,Object? timer = freezed,}) {
  return _then(_CookStep(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,timer: freezed == timer ? _self.timer : timer // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
