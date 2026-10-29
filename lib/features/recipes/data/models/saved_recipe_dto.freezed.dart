// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedRecipeDto {

 String get id; String get name; String get category; String get area; String get imageUrl; String get thumbnailUrl; List<SavedIngredientDto> get ingredients; List<String> get steps; DateTime get savedAt;
/// Create a copy of SavedRecipeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedRecipeDtoCopyWith<SavedRecipeDto> get copyWith => _$SavedRecipeDtoCopyWithImpl<SavedRecipeDto>(this as SavedRecipeDto, _$identity);

  /// Serializes this SavedRecipeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,imageUrl,thumbnailUrl,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),savedAt);

@override
String toString() {
  return 'SavedRecipeDto(id: $id, name: $name, category: $category, area: $area, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients, steps: $steps, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class $SavedRecipeDtoCopyWith<$Res>  {
  factory $SavedRecipeDtoCopyWith(SavedRecipeDto value, $Res Function(SavedRecipeDto) _then) = _$SavedRecipeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String area, String imageUrl, String thumbnailUrl, List<SavedIngredientDto> ingredients, List<String> steps, DateTime savedAt
});




}
/// @nodoc
class _$SavedRecipeDtoCopyWithImpl<$Res>
    implements $SavedRecipeDtoCopyWith<$Res> {
  _$SavedRecipeDtoCopyWithImpl(this._self, this._then);

  final SavedRecipeDto _self;
  final $Res Function(SavedRecipeDto) _then;

/// Create a copy of SavedRecipeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? area = null,Object? imageUrl = null,Object? thumbnailUrl = null,Object? ingredients = null,Object? steps = null,Object? savedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<SavedIngredientDto>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedRecipeDto].
extension SavedRecipeDtoPatterns on SavedRecipeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedRecipeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedRecipeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedRecipeDto value)  $default,){
final _that = this;
switch (_that) {
case _SavedRecipeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedRecipeDto value)?  $default,){
final _that = this;
switch (_that) {
case _SavedRecipeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<SavedIngredientDto> ingredients,  List<String> steps,  DateTime savedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedRecipeDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps,_that.savedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<SavedIngredientDto> ingredients,  List<String> steps,  DateTime savedAt)  $default,) {final _that = this;
switch (_that) {
case _SavedRecipeDto():
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps,_that.savedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<SavedIngredientDto> ingredients,  List<String> steps,  DateTime savedAt)?  $default,) {final _that = this;
switch (_that) {
case _SavedRecipeDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps,_that.savedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedRecipeDto implements SavedRecipeDto {
  const _SavedRecipeDto({required this.id, required this.name, required this.category, required this.area, required this.imageUrl, required this.thumbnailUrl, required final  List<SavedIngredientDto> ingredients, required final  List<String> steps, required this.savedAt}): _ingredients = ingredients,_steps = steps;
  factory _SavedRecipeDto.fromJson(Map<String, dynamic> json) => _$SavedRecipeDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String area;
@override final  String imageUrl;
@override final  String thumbnailUrl;
 final  List<SavedIngredientDto> _ingredients;
@override List<SavedIngredientDto> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<String> _steps;
@override List<String> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  DateTime savedAt;

/// Create a copy of SavedRecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedRecipeDtoCopyWith<_SavedRecipeDto> get copyWith => __$SavedRecipeDtoCopyWithImpl<_SavedRecipeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedRecipeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedRecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,imageUrl,thumbnailUrl,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),savedAt);

@override
String toString() {
  return 'SavedRecipeDto(id: $id, name: $name, category: $category, area: $area, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients, steps: $steps, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$SavedRecipeDtoCopyWith<$Res> implements $SavedRecipeDtoCopyWith<$Res> {
  factory _$SavedRecipeDtoCopyWith(_SavedRecipeDto value, $Res Function(_SavedRecipeDto) _then) = __$SavedRecipeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String area, String imageUrl, String thumbnailUrl, List<SavedIngredientDto> ingredients, List<String> steps, DateTime savedAt
});




}
/// @nodoc
class __$SavedRecipeDtoCopyWithImpl<$Res>
    implements _$SavedRecipeDtoCopyWith<$Res> {
  __$SavedRecipeDtoCopyWithImpl(this._self, this._then);

  final _SavedRecipeDto _self;
  final $Res Function(_SavedRecipeDto) _then;

/// Create a copy of SavedRecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? area = null,Object? imageUrl = null,Object? thumbnailUrl = null,Object? ingredients = null,Object? steps = null,Object? savedAt = null,}) {
  return _then(_SavedRecipeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<SavedIngredientDto>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SavedIngredientDto {

 String get name; String get measure;
/// Create a copy of SavedIngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedIngredientDtoCopyWith<SavedIngredientDto> get copyWith => _$SavedIngredientDtoCopyWithImpl<SavedIngredientDto>(this as SavedIngredientDto, _$identity);

  /// Serializes this SavedIngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedIngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,measure);

@override
String toString() {
  return 'SavedIngredientDto(name: $name, measure: $measure)';
}


}

/// @nodoc
abstract mixin class $SavedIngredientDtoCopyWith<$Res>  {
  factory $SavedIngredientDtoCopyWith(SavedIngredientDto value, $Res Function(SavedIngredientDto) _then) = _$SavedIngredientDtoCopyWithImpl;
@useResult
$Res call({
 String name, String measure
});




}
/// @nodoc
class _$SavedIngredientDtoCopyWithImpl<$Res>
    implements $SavedIngredientDtoCopyWith<$Res> {
  _$SavedIngredientDtoCopyWithImpl(this._self, this._then);

  final SavedIngredientDto _self;
  final $Res Function(SavedIngredientDto) _then;

/// Create a copy of SavedIngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? measure = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedIngredientDto].
extension SavedIngredientDtoPatterns on SavedIngredientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedIngredientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedIngredientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedIngredientDto value)  $default,){
final _that = this;
switch (_that) {
case _SavedIngredientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedIngredientDto value)?  $default,){
final _that = this;
switch (_that) {
case _SavedIngredientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String measure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedIngredientDto() when $default != null:
return $default(_that.name,_that.measure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String measure)  $default,) {final _that = this;
switch (_that) {
case _SavedIngredientDto():
return $default(_that.name,_that.measure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String measure)?  $default,) {final _that = this;
switch (_that) {
case _SavedIngredientDto() when $default != null:
return $default(_that.name,_that.measure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedIngredientDto implements SavedIngredientDto {
  const _SavedIngredientDto({required this.name, required this.measure});
  factory _SavedIngredientDto.fromJson(Map<String, dynamic> json) => _$SavedIngredientDtoFromJson(json);

@override final  String name;
@override final  String measure;

/// Create a copy of SavedIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedIngredientDtoCopyWith<_SavedIngredientDto> get copyWith => __$SavedIngredientDtoCopyWithImpl<_SavedIngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedIngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedIngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,measure);

@override
String toString() {
  return 'SavedIngredientDto(name: $name, measure: $measure)';
}


}

/// @nodoc
abstract mixin class _$SavedIngredientDtoCopyWith<$Res> implements $SavedIngredientDtoCopyWith<$Res> {
  factory _$SavedIngredientDtoCopyWith(_SavedIngredientDto value, $Res Function(_SavedIngredientDto) _then) = __$SavedIngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String measure
});




}
/// @nodoc
class __$SavedIngredientDtoCopyWithImpl<$Res>
    implements _$SavedIngredientDtoCopyWith<$Res> {
  __$SavedIngredientDtoCopyWithImpl(this._self, this._then);

  final _SavedIngredientDto _self;
  final $Res Function(_SavedIngredientDto) _then;

/// Create a copy of SavedIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? measure = null,}) {
  return _then(_SavedIngredientDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
