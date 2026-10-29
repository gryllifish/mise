// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Recipe {

 String get id; String get name; String get category;/// Cuisine of origin, e.g. "Italian".
 String get area;/// Full-size photo, for the detail screen.
 String get imageUrl;/// Smaller photo, for cards and lists.
 String get thumbnailUrl; List<Ingredient> get ingredients;/// Instructions split into one action per step.
 List<String> get steps;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,imageUrl,thumbnailUrl,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Recipe(id: $id, name: $name, category: $category, area: $area, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String area, String imageUrl, String thumbnailUrl, List<Ingredient> ingredients, List<String> steps
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? area = null,Object? imageUrl = null,Object? thumbnailUrl = null,Object? ingredients = null,Object? steps = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<Ingredient> ingredients,  List<String> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<Ingredient> ingredients,  List<String> steps)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String area,  String imageUrl,  String thumbnailUrl,  List<Ingredient> ingredients,  List<String> steps)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.area,_that.imageUrl,_that.thumbnailUrl,_that.ingredients,_that.steps);case _:
  return null;

}
}

}

/// @nodoc


class _Recipe extends Recipe {
  const _Recipe({required this.id, required this.name, required this.category, required this.area, required this.imageUrl, required this.thumbnailUrl, required final  List<Ingredient> ingredients, required final  List<String> steps}): _ingredients = ingredients,_steps = steps,super._();
  

@override final  String id;
@override final  String name;
@override final  String category;
/// Cuisine of origin, e.g. "Italian".
@override final  String area;
/// Full-size photo, for the detail screen.
@override final  String imageUrl;
/// Smaller photo, for cards and lists.
@override final  String thumbnailUrl;
 final  List<Ingredient> _ingredients;
@override List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

/// Instructions split into one action per step.
 final  List<String> _steps;
/// Instructions split into one action per step.
@override List<String> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.area, area) || other.area == area)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,area,imageUrl,thumbnailUrl,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Recipe(id: $id, name: $name, category: $category, area: $area, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, ingredients: $ingredients, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String area, String imageUrl, String thumbnailUrl, List<Ingredient> ingredients, List<String> steps
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? area = null,Object? imageUrl = null,Object? thumbnailUrl = null,Object? ingredients = null,Object? steps = null,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$Ingredient {

 String get name;/// Free-form quantity as written by the author, e.g. "1/2 cup".
 String get measure;/// Cut-out photo of the ingredient on a transparent background.
 String get imageUrl;
/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientCopyWith<Ingredient> get copyWith => _$IngredientCopyWithImpl<Ingredient>(this as Ingredient, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,measure,imageUrl);

@override
String toString() {
  return 'Ingredient(name: $name, measure: $measure, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $IngredientCopyWith<$Res>  {
  factory $IngredientCopyWith(Ingredient value, $Res Function(Ingredient) _then) = _$IngredientCopyWithImpl;
@useResult
$Res call({
 String name, String measure, String imageUrl
});




}
/// @nodoc
class _$IngredientCopyWithImpl<$Res>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._self, this._then);

  final Ingredient _self;
  final $Res Function(Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? measure = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Ingredient].
extension IngredientPatterns on Ingredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ingredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ingredient value)  $default,){
final _that = this;
switch (_that) {
case _Ingredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ingredient value)?  $default,){
final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String measure,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.name,_that.measure,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String measure,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _Ingredient():
return $default(_that.name,_that.measure,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String measure,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _Ingredient() when $default != null:
return $default(_that.name,_that.measure,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Ingredient implements Ingredient {
  const _Ingredient({required this.name, required this.measure, required this.imageUrl});
  

@override final  String name;
/// Free-form quantity as written by the author, e.g. "1/2 cup".
@override final  String measure;
/// Cut-out photo of the ingredient on a transparent background.
@override final  String imageUrl;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientCopyWith<_Ingredient> get copyWith => __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ingredient&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,measure,imageUrl);

@override
String toString() {
  return 'Ingredient(name: $name, measure: $measure, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(_Ingredient value, $Res Function(_Ingredient) _then) = __$IngredientCopyWithImpl;
@override @useResult
$Res call({
 String name, String measure, String imageUrl
});




}
/// @nodoc
class __$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(this._self, this._then);

  final _Ingredient _self;
  final $Res Function(_Ingredient) _then;

/// Create a copy of Ingredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? measure = null,Object? imageUrl = null,}) {
  return _then(_Ingredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RecipeSummary {

 String get id; String get name; String get thumbnailUrl;
/// Create a copy of RecipeSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeSummaryCopyWith<RecipeSummary> get copyWith => _$RecipeSummaryCopyWithImpl<RecipeSummary>(this as RecipeSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnailUrl);

@override
String toString() {
  return 'RecipeSummary(id: $id, name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $RecipeSummaryCopyWith<$Res>  {
  factory $RecipeSummaryCopyWith(RecipeSummary value, $Res Function(RecipeSummary) _then) = _$RecipeSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String thumbnailUrl
});




}
/// @nodoc
class _$RecipeSummaryCopyWithImpl<$Res>
    implements $RecipeSummaryCopyWith<$Res> {
  _$RecipeSummaryCopyWithImpl(this._self, this._then);

  final RecipeSummary _self;
  final $Res Function(RecipeSummary) _then;

/// Create a copy of RecipeSummary
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


/// Adds pattern-matching-related methods to [RecipeSummary].
extension RecipeSummaryPatterns on RecipeSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeSummary value)  $default,){
final _that = this;
switch (_that) {
case _RecipeSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeSummary value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeSummary() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _RecipeSummary():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _RecipeSummary() when $default != null:
return $default(_that.id,_that.name,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeSummary implements RecipeSummary {
  const _RecipeSummary({required this.id, required this.name, required this.thumbnailUrl});
  

@override final  String id;
@override final  String name;
@override final  String thumbnailUrl;

/// Create a copy of RecipeSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeSummaryCopyWith<_RecipeSummary> get copyWith => __$RecipeSummaryCopyWithImpl<_RecipeSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,thumbnailUrl);

@override
String toString() {
  return 'RecipeSummary(id: $id, name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$RecipeSummaryCopyWith<$Res> implements $RecipeSummaryCopyWith<$Res> {
  factory _$RecipeSummaryCopyWith(_RecipeSummary value, $Res Function(_RecipeSummary) _then) = __$RecipeSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String thumbnailUrl
});




}
/// @nodoc
class __$RecipeSummaryCopyWithImpl<$Res>
    implements _$RecipeSummaryCopyWith<$Res> {
  __$RecipeSummaryCopyWithImpl(this._self, this._then);

  final _RecipeSummary _self;
  final $Res Function(_RecipeSummary) _then;

/// Create a copy of RecipeSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_RecipeSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RecipeCategory {

 String get name; String get thumbnailUrl;
/// Create a copy of RecipeCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCategoryCopyWith<RecipeCategory> get copyWith => _$RecipeCategoryCopyWithImpl<RecipeCategory>(this as RecipeCategory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,thumbnailUrl);

@override
String toString() {
  return 'RecipeCategory(name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $RecipeCategoryCopyWith<$Res>  {
  factory $RecipeCategoryCopyWith(RecipeCategory value, $Res Function(RecipeCategory) _then) = _$RecipeCategoryCopyWithImpl;
@useResult
$Res call({
 String name, String thumbnailUrl
});




}
/// @nodoc
class _$RecipeCategoryCopyWithImpl<$Res>
    implements $RecipeCategoryCopyWith<$Res> {
  _$RecipeCategoryCopyWithImpl(this._self, this._then);

  final RecipeCategory _self;
  final $Res Function(RecipeCategory) _then;

/// Create a copy of RecipeCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeCategory].
extension RecipeCategoryPatterns on RecipeCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeCategory value)  $default,){
final _that = this;
switch (_that) {
case _RecipeCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeCategory value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeCategory() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _RecipeCategory():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _RecipeCategory() when $default != null:
return $default(_that.name,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeCategory implements RecipeCategory {
  const _RecipeCategory({required this.name, required this.thumbnailUrl});
  

@override final  String name;
@override final  String thumbnailUrl;

/// Create a copy of RecipeCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCategoryCopyWith<_RecipeCategory> get copyWith => __$RecipeCategoryCopyWithImpl<_RecipeCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}


@override
int get hashCode => Object.hash(runtimeType,name,thumbnailUrl);

@override
String toString() {
  return 'RecipeCategory(name: $name, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$RecipeCategoryCopyWith<$Res> implements $RecipeCategoryCopyWith<$Res> {
  factory _$RecipeCategoryCopyWith(_RecipeCategory value, $Res Function(_RecipeCategory) _then) = __$RecipeCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, String thumbnailUrl
});




}
/// @nodoc
class __$RecipeCategoryCopyWithImpl<$Res>
    implements _$RecipeCategoryCopyWith<$Res> {
  __$RecipeCategoryCopyWithImpl(this._self, this._then);

  final _RecipeCategory _self;
  final $Res Function(_RecipeCategory) _then;

/// Create a copy of RecipeCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? thumbnailUrl = null,}) {
  return _then(_RecipeCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Cuisine {

 String get name;/// Flag emoji of its country.
 String get flag;
/// Create a copy of Cuisine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CuisineCopyWith<Cuisine> get copyWith => _$CuisineCopyWithImpl<Cuisine>(this as Cuisine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cuisine&&(identical(other.name, name) || other.name == name)&&(identical(other.flag, flag) || other.flag == flag));
}


@override
int get hashCode => Object.hash(runtimeType,name,flag);

@override
String toString() {
  return 'Cuisine(name: $name, flag: $flag)';
}


}

/// @nodoc
abstract mixin class $CuisineCopyWith<$Res>  {
  factory $CuisineCopyWith(Cuisine value, $Res Function(Cuisine) _then) = _$CuisineCopyWithImpl;
@useResult
$Res call({
 String name, String flag
});




}
/// @nodoc
class _$CuisineCopyWithImpl<$Res>
    implements $CuisineCopyWith<$Res> {
  _$CuisineCopyWithImpl(this._self, this._then);

  final Cuisine _self;
  final $Res Function(Cuisine) _then;

/// Create a copy of Cuisine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? flag = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Cuisine].
extension CuisinePatterns on Cuisine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cuisine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cuisine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cuisine value)  $default,){
final _that = this;
switch (_that) {
case _Cuisine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cuisine value)?  $default,){
final _that = this;
switch (_that) {
case _Cuisine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String flag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cuisine() when $default != null:
return $default(_that.name,_that.flag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String flag)  $default,) {final _that = this;
switch (_that) {
case _Cuisine():
return $default(_that.name,_that.flag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String flag)?  $default,) {final _that = this;
switch (_that) {
case _Cuisine() when $default != null:
return $default(_that.name,_that.flag);case _:
  return null;

}
}

}

/// @nodoc


class _Cuisine implements Cuisine {
  const _Cuisine({required this.name, required this.flag});
  

@override final  String name;
/// Flag emoji of its country.
@override final  String flag;

/// Create a copy of Cuisine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CuisineCopyWith<_Cuisine> get copyWith => __$CuisineCopyWithImpl<_Cuisine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cuisine&&(identical(other.name, name) || other.name == name)&&(identical(other.flag, flag) || other.flag == flag));
}


@override
int get hashCode => Object.hash(runtimeType,name,flag);

@override
String toString() {
  return 'Cuisine(name: $name, flag: $flag)';
}


}

/// @nodoc
abstract mixin class _$CuisineCopyWith<$Res> implements $CuisineCopyWith<$Res> {
  factory _$CuisineCopyWith(_Cuisine value, $Res Function(_Cuisine) _then) = __$CuisineCopyWithImpl;
@override @useResult
$Res call({
 String name, String flag
});




}
/// @nodoc
class __$CuisineCopyWithImpl<$Res>
    implements _$CuisineCopyWith<$Res> {
  __$CuisineCopyWithImpl(this._self, this._then);

  final _Cuisine _self;
  final $Res Function(_Cuisine) _then;

/// Create a copy of Cuisine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? flag = null,}) {
  return _then(_Cuisine(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,flag: null == flag ? _self.flag : flag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
