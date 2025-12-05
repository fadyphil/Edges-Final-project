// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

/// Manages the loading/success/error state for the user's profile info.
 ApiState<UserProfile> get userProfileState;/// Manages the loading/success/error state for the calculated app statistics.
 ApiState<AppStatistics> get statisticsState;/// Manages the state of any update or clear operations.
 ApiState<void> get actionState;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.userProfileState, userProfileState) || other.userProfileState == userProfileState)&&(identical(other.statisticsState, statisticsState) || other.statisticsState == statisticsState)&&(identical(other.actionState, actionState) || other.actionState == actionState));
}


@override
int get hashCode => Object.hash(runtimeType,userProfileState,statisticsState,actionState);

@override
String toString() {
  return 'ProfileState(userProfileState: $userProfileState, statisticsState: $statisticsState, actionState: $actionState)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 ApiState<UserProfile> userProfileState, ApiState<AppStatistics> statisticsState, ApiState<void> actionState
});


$ApiStateCopyWith<UserProfile, $Res> get userProfileState;$ApiStateCopyWith<AppStatistics, $Res> get statisticsState;$ApiStateCopyWith<void, $Res> get actionState;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userProfileState = null,Object? statisticsState = null,Object? actionState = null,}) {
  return _then(_self.copyWith(
userProfileState: null == userProfileState ? _self.userProfileState : userProfileState // ignore: cast_nullable_to_non_nullable
as ApiState<UserProfile>,statisticsState: null == statisticsState ? _self.statisticsState : statisticsState // ignore: cast_nullable_to_non_nullable
as ApiState<AppStatistics>,actionState: null == actionState ? _self.actionState : actionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<UserProfile, $Res> get userProfileState {
  
  return $ApiStateCopyWith<UserProfile, $Res>(_self.userProfileState, (value) {
    return _then(_self.copyWith(userProfileState: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<AppStatistics, $Res> get statisticsState {
  
  return $ApiStateCopyWith<AppStatistics, $Res>(_self.statisticsState, (value) {
    return _then(_self.copyWith(statisticsState: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get actionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.actionState, (value) {
    return _then(_self.copyWith(actionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApiState<UserProfile> userProfileState,  ApiState<AppStatistics> statisticsState,  ApiState<void> actionState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfileState,_that.statisticsState,_that.actionState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApiState<UserProfile> userProfileState,  ApiState<AppStatistics> statisticsState,  ApiState<void> actionState)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.userProfileState,_that.statisticsState,_that.actionState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApiState<UserProfile> userProfileState,  ApiState<AppStatistics> statisticsState,  ApiState<void> actionState)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfileState,_that.statisticsState,_that.actionState);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.userProfileState = const ApiState.initial(), this.statisticsState = const ApiState.initial(), this.actionState = const ApiState.initial()});
  

/// Manages the loading/success/error state for the user's profile info.
@override@JsonKey() final  ApiState<UserProfile> userProfileState;
/// Manages the loading/success/error state for the calculated app statistics.
@override@JsonKey() final  ApiState<AppStatistics> statisticsState;
/// Manages the state of any update or clear operations.
@override@JsonKey() final  ApiState<void> actionState;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.userProfileState, userProfileState) || other.userProfileState == userProfileState)&&(identical(other.statisticsState, statisticsState) || other.statisticsState == statisticsState)&&(identical(other.actionState, actionState) || other.actionState == actionState));
}


@override
int get hashCode => Object.hash(runtimeType,userProfileState,statisticsState,actionState);

@override
String toString() {
  return 'ProfileState(userProfileState: $userProfileState, statisticsState: $statisticsState, actionState: $actionState)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 ApiState<UserProfile> userProfileState, ApiState<AppStatistics> statisticsState, ApiState<void> actionState
});


@override $ApiStateCopyWith<UserProfile, $Res> get userProfileState;@override $ApiStateCopyWith<AppStatistics, $Res> get statisticsState;@override $ApiStateCopyWith<void, $Res> get actionState;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userProfileState = null,Object? statisticsState = null,Object? actionState = null,}) {
  return _then(_ProfileState(
userProfileState: null == userProfileState ? _self.userProfileState : userProfileState // ignore: cast_nullable_to_non_nullable
as ApiState<UserProfile>,statisticsState: null == statisticsState ? _self.statisticsState : statisticsState // ignore: cast_nullable_to_non_nullable
as ApiState<AppStatistics>,actionState: null == actionState ? _self.actionState : actionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<UserProfile, $Res> get userProfileState {
  
  return $ApiStateCopyWith<UserProfile, $Res>(_self.userProfileState, (value) {
    return _then(_self.copyWith(userProfileState: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<AppStatistics, $Res> get statisticsState {
  
  return $ApiStateCopyWith<AppStatistics, $Res>(_self.statisticsState, (value) {
    return _then(_self.copyWith(statisticsState: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get actionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.actionState, (value) {
    return _then(_self.copyWith(actionState: value));
  });
}
}

// dart format on
