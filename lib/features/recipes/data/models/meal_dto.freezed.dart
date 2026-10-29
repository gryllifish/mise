// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealDto {

@JsonKey(name: 'idMeal') String get id;@JsonKey(name: 'strMeal') String get name;@JsonKey(name: 'strCategory') String? get category;@JsonKey(name: 'strArea') String? get area;@JsonKey(name: 'strInstructions') String? get instructions;@JsonKey(name: 'strMealThumb') String get thumbnailUrl;@JsonKey(readValue: readIngredients) List<IngredientDto> get ingredients;
/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDtoCopyWith<MealDto> get copyWith => _$MealDtoCopyWithImpl<MealDto>(this as MealDto, _$identity);

  /// Serializes this MealDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,instructions,thumbnailUrl,const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'MealDto(id: $id, name: $name, category: $category, area: $area, instructions: $instructions, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $MealDtoCopyWith<$Res>  {
  factory $MealDtoCopyWith(MealDto value, $Res Function(MealDto) _then) = _$MealDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'idMeal') String id,@JsonKey(name: 'strMeal') String name,@JsonKey(name: 'strCategory') String? category,@JsonKey(name: 'strArea') String? area,@JsonKey(name: 'strInstructions') String? instructions,@JsonKey(name: 'strMealThumb') String thumbnailUrl,@JsonKey(readValue: readIngredients) List<IngredientDto> ingredients
});




}
/// @nodoc
class _$MealDtoCopyWithImpl<$Res>
    implements $MealDtoCopyWith<$Res> {
  _$MealDtoCopyWithImpl(this._self, this._then);

  final MealDto _self;
  final $Res Function(MealDto) _then;

/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = freezed,Object? area = freezed,Object? instructions = freezed,Object? thumbnailUrl = null,Object? ingredients = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDto].
extension MealDtoPatterns on MealDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDto value)  $default,){
final _that = this;
switch (_that) {
case _MealDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strCategory')  String? category, @JsonKey(name: 'strArea')  String? area, @JsonKey(name: 'strInstructions')  String? instructions, @JsonKey(name: 'strMealThumb')  String thumbnailUrl, @JsonKey(readValue: readIngredients)  List<IngredientDto> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.instructions,_that.thumbnailUrl,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strCategory')  String? category, @JsonKey(name: 'strArea')  String? area, @JsonKey(name: 'strInstructions')  String? instructions, @JsonKey(name: 'strMealThumb')  String thumbnailUrl, @JsonKey(readValue: readIngredients)  List<IngredientDto> ingredients)  $default,) {final _that = this;
switch (_that) {
case _MealDto():
return $default(_that.id,_that.name,_that.category,_that.area,_that.instructions,_that.thumbnailUrl,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strCategory')  String? category, @JsonKey(name: 'strArea')  String? area, @JsonKey(name: 'strInstructions')  String? instructions, @JsonKey(name: 'strMealThumb')  String thumbnailUrl, @JsonKey(readValue: readIngredients)  List<IngredientDto> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _MealDto() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.instructions,_that.thumbnailUrl,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealDto implements MealDto {
  const _MealDto({@JsonKey(name: 'idMeal') required this.id, @JsonKey(name: 'strMeal') required this.name, @JsonKey(name: 'strCategory') required this.category, @JsonKey(name: 'strArea') required this.area, @JsonKey(name: 'strInstructions') required this.instructions, @JsonKey(name: 'strMealThumb') required this.thumbnailUrl, @JsonKey(readValue: readIngredients) required final  List<IngredientDto> ingredients}): _ingredients = ingredients;
  factory _MealDto.fromJson(Map<String, dynamic> json) => _$MealDtoFromJson(json);

@override@JsonKey(name: 'idMeal') final  String id;
@override@JsonKey(name: 'strMeal') final  String name;
@override@JsonKey(name: 'strCategory') final  String? category;
@override@JsonKey(name: 'strArea') final  String? area;
@override@JsonKey(name: 'strInstructions') final  String? instructions;
@override@JsonKey(name: 'strMealThumb') final  String thumbnailUrl;
 final  List<IngredientDto> _ingredients;
@override@JsonKey(readValue: readIngredients) List<IngredientDto> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDtoCopyWith<_MealDto> get copyWith => __$MealDtoCopyWithImpl<_MealDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,instructions,thumbnailUrl,const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'MealDto(id: $id, name: $name, category: $category, area: $area, instructions: $instructions, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$MealDtoCopyWith<$Res> implements $MealDtoCopyWith<$Res> {
  factory _$MealDtoCopyWith(_MealDto value, $Res Function(_MealDto) _then) = __$MealDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'idMeal') String id,@JsonKey(name: 'strMeal') String name,@JsonKey(name: 'strCategory') String? category,@JsonKey(name: 'strArea') String? area,@JsonKey(name: 'strInstructions') String? instructions,@JsonKey(name: 'strMealThumb') String thumbnailUrl,@JsonKey(readValue: readIngredients) List<IngredientDto> ingredients
});




}
/// @nodoc
class __$MealDtoCopyWithImpl<$Res>
    implements _$MealDtoCopyWith<$Res> {
  __$MealDtoCopyWithImpl(this._self, this._then);

  final _MealDto _self;
  final $Res Function(_MealDto) _then;

/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = freezed,Object? area = freezed,Object? instructions = freezed,Object? thumbnailUrl = null,Object? ingredients = null,}) {
  return _then(_MealDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientDto>,
  ));
}


}


/// @nodoc
mixin _$IngredientDto {

 String get name; String get measure;
/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientDtoCopyWith<IngredientDto> get copyWith => _$IngredientDtoCopyWithImpl<IngredientDto>(this as IngredientDto, _$identity);

  /// Serializes this IngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,measure);

@override
String toString() {
  return 'IngredientDto(name: $name, measure: $measure)';
}


}

/// @nodoc
abstract mixin class $IngredientDtoCopyWith<$Res>  {
  factory $IngredientDtoCopyWith(IngredientDto value, $Res Function(IngredientDto) _then) = _$IngredientDtoCopyWithImpl;
@useResult
$Res call({
 String name, String measure
});




}
/// @nodoc
class _$IngredientDtoCopyWithImpl<$Res>
    implements $IngredientDtoCopyWith<$Res> {
  _$IngredientDtoCopyWithImpl(this._self, this._then);

  final IngredientDto _self;
  final $Res Function(IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? measure = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientDto].
extension IngredientDtoPatterns on IngredientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientDto value)  $default,){
final _that = this;
switch (_that) {
case _IngredientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientDto value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientDto() when $default != null:
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
case _IngredientDto() when $default != null:
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
case _IngredientDto():
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
case _IngredientDto() when $default != null:
return $default(_that.name,_that.measure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientDto implements IngredientDto {
  const _IngredientDto({required this.name, required this.measure});
  factory _IngredientDto.fromJson(Map<String, dynamic> json) => _$IngredientDtoFromJson(json);

@override final  String name;
@override final  String measure;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientDtoCopyWith<_IngredientDto> get copyWith => __$IngredientDtoCopyWithImpl<_IngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientDto&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,measure);

@override
String toString() {
  return 'IngredientDto(name: $name, measure: $measure)';
}


}

/// @nodoc
abstract mixin class _$IngredientDtoCopyWith<$Res> implements $IngredientDtoCopyWith<$Res> {
  factory _$IngredientDtoCopyWith(_IngredientDto value, $Res Function(_IngredientDto) _then) = __$IngredientDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String measure
});




}
/// @nodoc
class __$IngredientDtoCopyWithImpl<$Res>
    implements _$IngredientDtoCopyWith<$Res> {
  __$IngredientDtoCopyWithImpl(this._self, this._then);

  final _IngredientDto _self;
  final $Res Function(_IngredientDto) _then;

/// Create a copy of IngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? measure = null,}) {
  return _then(_IngredientDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MealSummaryDto {

@JsonKey(name: 'idMeal') String get id;@JsonKey(name: 'strMeal') String get name;@JsonKey(name: 'strMealThumb') String get thumbnailUrl;
/// Create a copy of MealSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealSummaryDtoCopyWith<MealSummaryDto> get copyWith => _$MealSummaryDtoCopyWithImpl<MealSummaryDto>(this as MealSummaryDto, _$identity);

  /// Serializes this MealSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnailUrl);

@override
String toString() {
  return 'MealSummaryDto(id: $id, name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $MealSummaryDtoCopyWith<$Res>  {
  factory $MealSummaryDtoCopyWith(MealSummaryDto value, $Res Function(MealSummaryDto) _then) = _$MealSummaryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'idMeal') String id,@JsonKey(name: 'strMeal') String name,@JsonKey(name: 'strMealThumb') String thumbnailUrl
});




}
/// @nodoc
class _$MealSummaryDtoCopyWithImpl<$Res>
    implements $MealSummaryDtoCopyWith<$Res> {
  _$MealSummaryDtoCopyWithImpl(this._self, this._then);

  final MealSummaryDto _self;
  final $Res Function(MealSummaryDto) _then;

/// Create a copy of MealSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MealSummaryDto].
extension MealSummaryDtoPatterns on MealSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _MealSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strMealThumb')  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealSummaryDto() when $default != null:
return $default(_that.id,_that.name,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strMealThumb')  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _MealSummaryDto():
return $default(_that.id,_that.name,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'idMeal')  String id, @JsonKey(name: 'strMeal')  String name, @JsonKey(name: 'strMealThumb')  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _MealSummaryDto() when $default != null:
return $default(_that.id,_that.name,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealSummaryDto implements MealSummaryDto {
  const _MealSummaryDto({@JsonKey(name: 'idMeal') required this.id, @JsonKey(name: 'strMeal') required this.name, @JsonKey(name: 'strMealThumb') required this.thumbnailUrl});
  factory _MealSummaryDto.fromJson(Map<String, dynamic> json) => _$MealSummaryDtoFromJson(json);

@override@JsonKey(name: 'idMeal') final  String id;
@override@JsonKey(name: 'strMeal') final  String name;
@override@JsonKey(name: 'strMealThumb') final  String thumbnailUrl;

/// Create a copy of MealSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealSummaryDtoCopyWith<_MealSummaryDto> get copyWith => __$MealSummaryDtoCopyWithImpl<_MealSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnailUrl);

@override
String toString() {
  return 'MealSummaryDto(id: $id, name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$MealSummaryDtoCopyWith<$Res> implements $MealSummaryDtoCopyWith<$Res> {
  factory _$MealSummaryDtoCopyWith(_MealSummaryDto value, $Res Function(_MealSummaryDto) _then) = __$MealSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'idMeal') String id,@JsonKey(name: 'strMeal') String name,@JsonKey(name: 'strMealThumb') String thumbnailUrl
});




}
/// @nodoc
class __$MealSummaryDtoCopyWithImpl<$Res>
    implements _$MealSummaryDtoCopyWith<$Res> {
  __$MealSummaryDtoCopyWithImpl(this._self, this._then);

  final _MealSummaryDto _self;
  final $Res Function(_MealSummaryDto) _then;

/// Create a copy of MealSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_MealSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CategoryDto {

@JsonKey(name: 'strCategory') String get name;@JsonKey(name: 'strCategoryThumb') String get thumbnailUrl;
/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDtoCopyWith<CategoryDto> get copyWith => _$CategoryDtoCopyWithImpl<CategoryDto>(this as CategoryDto, _$identity);

  /// Serializes this CategoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDto&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,thumbnailUrl);

@override
String toString() {
  return 'CategoryDto(name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $CategoryDtoCopyWith<$Res>  {
  factory $CategoryDtoCopyWith(CategoryDto value, $Res Function(CategoryDto) _then) = _$CategoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strCategory') String name,@JsonKey(name: 'strCategoryThumb') String thumbnailUrl
});




}
/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._self, this._then);

  final CategoryDto _self;
  final $Res Function(CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDto].
extension CategoryDtoPatterns on CategoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDto value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strCategory')  String name, @JsonKey(name: 'strCategoryThumb')  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.name,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strCategory')  String name, @JsonKey(name: 'strCategoryThumb')  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _CategoryDto():
return $default(_that.name,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strCategory')  String name, @JsonKey(name: 'strCategoryThumb')  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDto() when $default != null:
return $default(_that.name,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryDto implements CategoryDto {
  const _CategoryDto({@JsonKey(name: 'strCategory') required this.name, @JsonKey(name: 'strCategoryThumb') required this.thumbnailUrl});
  factory _CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

@override@JsonKey(name: 'strCategory') final  String name;
@override@JsonKey(name: 'strCategoryThumb') final  String thumbnailUrl;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDtoCopyWith<_CategoryDto> get copyWith => __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDto&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,thumbnailUrl);

@override
String toString() {
  return 'CategoryDto(name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$CategoryDtoCopyWith<$Res> implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(_CategoryDto value, $Res Function(_CategoryDto) _then) = __$CategoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strCategory') String name,@JsonKey(name: 'strCategoryThumb') String thumbnailUrl
});




}
/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res>
    implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(this._self, this._then);

  final _CategoryDto _self;
  final $Res Function(_CategoryDto) _then;

/// Create a copy of CategoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_CategoryDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CatalogIngredientDto {

@JsonKey(name: 'strIngredient') String get name;
/// Create a copy of CatalogIngredientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogIngredientDtoCopyWith<CatalogIngredientDto> get copyWith => _$CatalogIngredientDtoCopyWithImpl<CatalogIngredientDto>(this as CatalogIngredientDto, _$identity);

  /// Serializes this CatalogIngredientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogIngredientDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CatalogIngredientDto(name: $name)';
}


}

/// @nodoc
abstract mixin class $CatalogIngredientDtoCopyWith<$Res>  {
  factory $CatalogIngredientDtoCopyWith(CatalogIngredientDto value, $Res Function(CatalogIngredientDto) _then) = _$CatalogIngredientDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strIngredient') String name
});




}
/// @nodoc
class _$CatalogIngredientDtoCopyWithImpl<$Res>
    implements $CatalogIngredientDtoCopyWith<$Res> {
  _$CatalogIngredientDtoCopyWithImpl(this._self, this._then);

  final CatalogIngredientDto _self;
  final $Res Function(CatalogIngredientDto) _then;

/// Create a copy of CatalogIngredientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogIngredientDto].
extension CatalogIngredientDtoPatterns on CatalogIngredientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogIngredientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogIngredientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogIngredientDto value)  $default,){
final _that = this;
switch (_that) {
case _CatalogIngredientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogIngredientDto value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogIngredientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strIngredient')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogIngredientDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strIngredient')  String name)  $default,) {final _that = this;
switch (_that) {
case _CatalogIngredientDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strIngredient')  String name)?  $default,) {final _that = this;
switch (_that) {
case _CatalogIngredientDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogIngredientDto implements CatalogIngredientDto {
  const _CatalogIngredientDto({@JsonKey(name: 'strIngredient') required this.name});
  factory _CatalogIngredientDto.fromJson(Map<String, dynamic> json) => _$CatalogIngredientDtoFromJson(json);

@override@JsonKey(name: 'strIngredient') final  String name;

/// Create a copy of CatalogIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogIngredientDtoCopyWith<_CatalogIngredientDto> get copyWith => __$CatalogIngredientDtoCopyWithImpl<_CatalogIngredientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogIngredientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogIngredientDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'CatalogIngredientDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$CatalogIngredientDtoCopyWith<$Res> implements $CatalogIngredientDtoCopyWith<$Res> {
  factory _$CatalogIngredientDtoCopyWith(_CatalogIngredientDto value, $Res Function(_CatalogIngredientDto) _then) = __$CatalogIngredientDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strIngredient') String name
});




}
/// @nodoc
class __$CatalogIngredientDtoCopyWithImpl<$Res>
    implements _$CatalogIngredientDtoCopyWith<$Res> {
  __$CatalogIngredientDtoCopyWithImpl(this._self, this._then);

  final _CatalogIngredientDto _self;
  final $Res Function(_CatalogIngredientDto) _then;

/// Create a copy of CatalogIngredientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_CatalogIngredientDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
