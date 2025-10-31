// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorites_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoritesScreenState {

// The state for loading the full Destination objects
 ApiState<List<Destination>> get favoritesState;
/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesScreenStateCopyWith<FavoritesScreenState> get copyWith => _$FavoritesScreenStateCopyWithImpl<FavoritesScreenState>(this as FavoritesScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoritesScreenState&&(identical(other.favoritesState, favoritesState) || other.favoritesState == favoritesState));
}


@override
int get hashCode => Object.hash(runtimeType,favoritesState);

@override
String toString() {
  return 'FavoritesScreenState(favoritesState: $favoritesState)';
}


}

/// @nodoc
abstract mixin class $FavoritesScreenStateCopyWith<$Res>  {
  factory $FavoritesScreenStateCopyWith(FavoritesScreenState value, $Res Function(FavoritesScreenState) _then) = _$FavoritesScreenStateCopyWithImpl;
@useResult
$Res call({
 ApiState<List<Destination>> favoritesState
});


$ApiStateCopyWith<List<Destination>, $Res> get favoritesState;

}
/// @nodoc
class _$FavoritesScreenStateCopyWithImpl<$Res>
    implements $FavoritesScreenStateCopyWith<$Res> {
  _$FavoritesScreenStateCopyWithImpl(this._self, this._then);

  final FavoritesScreenState _self;
  final $Res Function(FavoritesScreenState) _then;

/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favoritesState = null,}) {
  return _then(_self.copyWith(
favoritesState: null == favoritesState ? _self.favoritesState : favoritesState // ignore: cast_nullable_to_non_nullable
as ApiState<List<Destination>>,
  ));
}
/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<Destination>, $Res> get favoritesState {
  
  return $ApiStateCopyWith<List<Destination>, $Res>(_self.favoritesState, (value) {
    return _then(_self.copyWith(favoritesState: value));
  });
}
}


/// Adds pattern-matching-related methods to [FavoritesScreenState].
extension FavoritesScreenStatePatterns on FavoritesScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoritesScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoritesScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoritesScreenState value)  $default,){
final _that = this;
switch (_that) {
case _FavoritesScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoritesScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoritesScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApiState<List<Destination>> favoritesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoritesScreenState() when $default != null:
return $default(_that.favoritesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApiState<List<Destination>> favoritesState)  $default,) {final _that = this;
switch (_that) {
case _FavoritesScreenState():
return $default(_that.favoritesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApiState<List<Destination>> favoritesState)?  $default,) {final _that = this;
switch (_that) {
case _FavoritesScreenState() when $default != null:
return $default(_that.favoritesState);case _:
  return null;

}
}

}

/// @nodoc


class _FavoritesScreenState implements FavoritesScreenState {
  const _FavoritesScreenState({this.favoritesState = const ApiState.initial()});
  

// The state for loading the full Destination objects
@override@JsonKey() final  ApiState<List<Destination>> favoritesState;

/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesScreenStateCopyWith<_FavoritesScreenState> get copyWith => __$FavoritesScreenStateCopyWithImpl<_FavoritesScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoritesScreenState&&(identical(other.favoritesState, favoritesState) || other.favoritesState == favoritesState));
}


@override
int get hashCode => Object.hash(runtimeType,favoritesState);

@override
String toString() {
  return 'FavoritesScreenState(favoritesState: $favoritesState)';
}


}

/// @nodoc
abstract mixin class _$FavoritesScreenStateCopyWith<$Res> implements $FavoritesScreenStateCopyWith<$Res> {
  factory _$FavoritesScreenStateCopyWith(_FavoritesScreenState value, $Res Function(_FavoritesScreenState) _then) = __$FavoritesScreenStateCopyWithImpl;
@override @useResult
$Res call({
 ApiState<List<Destination>> favoritesState
});


@override $ApiStateCopyWith<List<Destination>, $Res> get favoritesState;

}
/// @nodoc
class __$FavoritesScreenStateCopyWithImpl<$Res>
    implements _$FavoritesScreenStateCopyWith<$Res> {
  __$FavoritesScreenStateCopyWithImpl(this._self, this._then);

  final _FavoritesScreenState _self;
  final $Res Function(_FavoritesScreenState) _then;

/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? favoritesState = null,}) {
  return _then(_FavoritesScreenState(
favoritesState: null == favoritesState ? _self.favoritesState : favoritesState // ignore: cast_nullable_to_non_nullable
as ApiState<List<Destination>>,
  ));
}

/// Create a copy of FavoritesScreenState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<Destination>, $Res> get favoritesState {
  
  return $ApiStateCopyWith<List<Destination>, $Res>(_self.favoritesState, (value) {
    return _then(_self.copyWith(favoritesState: value));
  });
}
}

// dart format on
