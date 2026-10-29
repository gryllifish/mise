// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogIngredient {

 String get name;/// Cut-out photo on a transparent background.
 String get imageUrl;
/// Create a copy of CatalogIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogIngredientCopyWith<CatalogIngredient> get copyWith => _$CatalogIngredientCopyWithImpl<CatalogIngredient>(this as CatalogIngredient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogIngredient&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString() {
  return 'CatalogIngredient(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CatalogIngredientCopyWith<$Res>  {
  factory $CatalogIngredientCopyWith(CatalogIngredient value, $Res Function(CatalogIngredient) _then) = _$CatalogIngredientCopyWithImpl;
@useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class _$CatalogIngredientCopyWithImpl<$Res>
    implements $CatalogIngredientCopyWith<$Res> {
  _$CatalogIngredientCopyWithImpl(this._self, this._then);

  final CatalogIngredient _self;
  final $Res Function(CatalogIngredient) _then;

/// Create a copy of CatalogIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogIngredient].
extension CatalogIngredientPatterns on CatalogIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogIngredient value)  $default,){
final _that = this;
switch (_that) {
case _CatalogIngredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogIngredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogIngredient() when $default != null:
return $default(_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _CatalogIngredient():
return $default(_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _CatalogIngredient() when $default != null:
return $default(_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogIngredient implements CatalogIngredient {
  const _CatalogIngredient({required this.name, required this.imageUrl});
  

@override final  String name;
/// Cut-out photo on a transparent background.
@override final  String imageUrl;

/// Create a copy of CatalogIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogIngredientCopyWith<_CatalogIngredient> get copyWith => __$CatalogIngredientCopyWithImpl<_CatalogIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogIngredient&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString() {
  return 'CatalogIngredient(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$CatalogIngredientCopyWith<$Res> implements $CatalogIngredientCopyWith<$Res> {
  factory _$CatalogIngredientCopyWith(_CatalogIngredient value, $Res Function(_CatalogIngredient) _then) = __$CatalogIngredientCopyWithImpl;
@override @useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class __$CatalogIngredientCopyWithImpl<$Res>
    implements _$CatalogIngredientCopyWith<$Res> {
  __$CatalogIngredientCopyWithImpl(this._self, this._then);

  final _CatalogIngredient _self;
  final $Res Function(_CatalogIngredient) _then;

/// Create a copy of CatalogIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_CatalogIngredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PantryMatch {

 RecipeSummary get recipe;/// Pantry ingredients the recipe uses.
 List<String> get uses;/// Recipe ingredients the pantry lacks, staples aside; null while the
/// full recipe is unknown.
 List<Ingredient>? get missing;
/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryMatchCopyWith<PantryMatch> get copyWith => _$PantryMatchCopyWithImpl<PantryMatch>(this as PantryMatch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryMatch&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other.uses, uses)&&const DeepCollectionEquality().equals(other.missing, missing));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(uses),const DeepCollectionEquality().hash(missing));

@override
String toString() {
  return 'PantryMatch(recipe: $recipe, uses: $uses, missing: $missing)';
}


}

/// @nodoc
abstract mixin class $PantryMatchCopyWith<$Res>  {
  factory $PantryMatchCopyWith(PantryMatch value, $Res Function(PantryMatch) _then) = _$PantryMatchCopyWithImpl;
@useResult
$Res call({
 RecipeSummary recipe, List<String> uses, List<Ingredient>? missing
});


$RecipeSummaryCopyWith<$Res> get recipe;

}
/// @nodoc
class _$PantryMatchCopyWithImpl<$Res>
    implements $PantryMatchCopyWith<$Res> {
  _$PantryMatchCopyWithImpl(this._self, this._then);

  final PantryMatch _self;
  final $Res Function(PantryMatch) _then;

/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipe = null,Object? uses = null,Object? missing = freezed,}) {
  return _then(_self.copyWith(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeSummary,uses: null == uses ? _self.uses : uses // ignore: cast_nullable_to_non_nullable
as List<String>,missing: freezed == missing ? _self.missing : missing // ignore: cast_nullable_to_non_nullable
as List<Ingredient>?,
  ));
}
/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSummaryCopyWith<$Res> get recipe {
  
  return $RecipeSummaryCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [PantryMatch].
extension PantryMatchPatterns on PantryMatch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryMatch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryMatch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryMatch value)  $default,){
final _that = this;
switch (_that) {
case _PantryMatch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryMatch value)?  $default,){
final _that = this;
switch (_that) {
case _PantryMatch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecipeSummary recipe,  List<String> uses,  List<Ingredient>? missing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryMatch() when $default != null:
return $default(_that.recipe,_that.uses,_that.missing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecipeSummary recipe,  List<String> uses,  List<Ingredient>? missing)  $default,) {final _that = this;
switch (_that) {
case _PantryMatch():
return $default(_that.recipe,_that.uses,_that.missing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecipeSummary recipe,  List<String> uses,  List<Ingredient>? missing)?  $default,) {final _that = this;
switch (_that) {
case _PantryMatch() when $default != null:
return $default(_that.recipe,_that.uses,_that.missing);case _:
  return null;

}
}

}

/// @nodoc


class _PantryMatch extends PantryMatch {
  const _PantryMatch({required this.recipe, required final  List<String> uses, final  List<Ingredient>? missing}): _uses = uses,_missing = missing,super._();
  

@override final  RecipeSummary recipe;
/// Pantry ingredients the recipe uses.
 final  List<String> _uses;
/// Pantry ingredients the recipe uses.
@override List<String> get uses {
  if (_uses is EqualUnmodifiableListView) return _uses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uses);
}

/// Recipe ingredients the pantry lacks, staples aside; null while the
/// full recipe is unknown.
 final  List<Ingredient>? _missing;
/// Recipe ingredients the pantry lacks, staples aside; null while the
/// full recipe is unknown.
@override List<Ingredient>? get missing {
  final value = _missing;
  if (value == null) return null;
  if (_missing is EqualUnmodifiableListView) return _missing;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryMatchCopyWith<_PantryMatch> get copyWith => __$PantryMatchCopyWithImpl<_PantryMatch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryMatch&&(identical(other.recipe, recipe) || other.recipe == recipe)&&const DeepCollectionEquality().equals(other._uses, _uses)&&const DeepCollectionEquality().equals(other._missing, _missing));
}


@override
int get hashCode => Object.hash(runtimeType,recipe,const DeepCollectionEquality().hash(_uses),const DeepCollectionEquality().hash(_missing));

@override
String toString() {
  return 'PantryMatch(recipe: $recipe, uses: $uses, missing: $missing)';
}


}

/// @nodoc
abstract mixin class _$PantryMatchCopyWith<$Res> implements $PantryMatchCopyWith<$Res> {
  factory _$PantryMatchCopyWith(_PantryMatch value, $Res Function(_PantryMatch) _then) = __$PantryMatchCopyWithImpl;
@override @useResult
$Res call({
 RecipeSummary recipe, List<String> uses, List<Ingredient>? missing
});


@override $RecipeSummaryCopyWith<$Res> get recipe;

}
/// @nodoc
class __$PantryMatchCopyWithImpl<$Res>
    implements _$PantryMatchCopyWith<$Res> {
  __$PantryMatchCopyWithImpl(this._self, this._then);

  final _PantryMatch _self;
  final $Res Function(_PantryMatch) _then;

/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipe = null,Object? uses = null,Object? missing = freezed,}) {
  return _then(_PantryMatch(
recipe: null == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeSummary,uses: null == uses ? _self._uses : uses // ignore: cast_nullable_to_non_nullable
as List<String>,missing: freezed == missing ? _self._missing : missing // ignore: cast_nullable_to_non_nullable
as List<Ingredient>?,
  ));
}

/// Create a copy of PantryMatch
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeSummaryCopyWith<$Res> get recipe {
  
  return $RecipeSummaryCopyWith<$Res>(_self.recipe, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
