// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_trips_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyTripsState {

/// Manages the loading/success/error state for fetching the master list of all trips.
 ApiState<List<TripWithDestination>> get tripsState;/// The currently active filter chosen by the user.
 TripFilter get activeFilter;/// A pre-filtered and sorted list of trips for the UI to display directly.
/// This is a "selector" derived from the main `tripsState`.
 List<TripWithDestination> get filteredTrips;/// A dedicated state machine to track actions like adding/deleting an expense
/// or updating a trip. This prevents the whole UI from showing a loading spinner.
 ApiState<void> get actionState;
/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyTripsStateCopyWith<MyTripsState> get copyWith => _$MyTripsStateCopyWithImpl<MyTripsState>(this as MyTripsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyTripsState&&(identical(other.tripsState, tripsState) || other.tripsState == tripsState)&&(identical(other.activeFilter, activeFilter) || other.activeFilter == activeFilter)&&const DeepCollectionEquality().equals(other.filteredTrips, filteredTrips)&&(identical(other.actionState, actionState) || other.actionState == actionState));
}


@override
int get hashCode => Object.hash(runtimeType,tripsState,activeFilter,const DeepCollectionEquality().hash(filteredTrips),actionState);

@override
String toString() {
  return 'MyTripsState(tripsState: $tripsState, activeFilter: $activeFilter, filteredTrips: $filteredTrips, actionState: $actionState)';
}


}

/// @nodoc
abstract mixin class $MyTripsStateCopyWith<$Res>  {
  factory $MyTripsStateCopyWith(MyTripsState value, $Res Function(MyTripsState) _then) = _$MyTripsStateCopyWithImpl;
@useResult
$Res call({
 ApiState<List<TripWithDestination>> tripsState, TripFilter activeFilter, List<TripWithDestination> filteredTrips, ApiState<void> actionState
});


$ApiStateCopyWith<List<TripWithDestination>, $Res> get tripsState;$ApiStateCopyWith<void, $Res> get actionState;

}
/// @nodoc
class _$MyTripsStateCopyWithImpl<$Res>
    implements $MyTripsStateCopyWith<$Res> {
  _$MyTripsStateCopyWithImpl(this._self, this._then);

  final MyTripsState _self;
  final $Res Function(MyTripsState) _then;

/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripsState = null,Object? activeFilter = null,Object? filteredTrips = null,Object? actionState = null,}) {
  return _then(_self.copyWith(
tripsState: null == tripsState ? _self.tripsState : tripsState // ignore: cast_nullable_to_non_nullable
as ApiState<List<TripWithDestination>>,activeFilter: null == activeFilter ? _self.activeFilter : activeFilter // ignore: cast_nullable_to_non_nullable
as TripFilter,filteredTrips: null == filteredTrips ? _self.filteredTrips : filteredTrips // ignore: cast_nullable_to_non_nullable
as List<TripWithDestination>,actionState: null == actionState ? _self.actionState : actionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}
/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<TripWithDestination>, $Res> get tripsState {
  
  return $ApiStateCopyWith<List<TripWithDestination>, $Res>(_self.tripsState, (value) {
    return _then(_self.copyWith(tripsState: value));
  });
}/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get actionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.actionState, (value) {
    return _then(_self.copyWith(actionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyTripsState].
extension MyTripsStatePatterns on MyTripsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyTripsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyTripsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyTripsState value)  $default,){
final _that = this;
switch (_that) {
case _MyTripsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyTripsState value)?  $default,){
final _that = this;
switch (_that) {
case _MyTripsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApiState<List<TripWithDestination>> tripsState,  TripFilter activeFilter,  List<TripWithDestination> filteredTrips,  ApiState<void> actionState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyTripsState() when $default != null:
return $default(_that.tripsState,_that.activeFilter,_that.filteredTrips,_that.actionState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApiState<List<TripWithDestination>> tripsState,  TripFilter activeFilter,  List<TripWithDestination> filteredTrips,  ApiState<void> actionState)  $default,) {final _that = this;
switch (_that) {
case _MyTripsState():
return $default(_that.tripsState,_that.activeFilter,_that.filteredTrips,_that.actionState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApiState<List<TripWithDestination>> tripsState,  TripFilter activeFilter,  List<TripWithDestination> filteredTrips,  ApiState<void> actionState)?  $default,) {final _that = this;
switch (_that) {
case _MyTripsState() when $default != null:
return $default(_that.tripsState,_that.activeFilter,_that.filteredTrips,_that.actionState);case _:
  return null;

}
}

}

/// @nodoc


class _MyTripsState implements MyTripsState {
  const _MyTripsState({this.tripsState = const ApiState.initial(), this.activeFilter = TripFilter.upcoming, final  List<TripWithDestination> filteredTrips = const [], this.actionState = const ApiState.initial()}): _filteredTrips = filteredTrips;
  

/// Manages the loading/success/error state for fetching the master list of all trips.
@override@JsonKey() final  ApiState<List<TripWithDestination>> tripsState;
/// The currently active filter chosen by the user.
@override@JsonKey() final  TripFilter activeFilter;
/// A pre-filtered and sorted list of trips for the UI to display directly.
/// This is a "selector" derived from the main `tripsState`.
 final  List<TripWithDestination> _filteredTrips;
/// A pre-filtered and sorted list of trips for the UI to display directly.
/// This is a "selector" derived from the main `tripsState`.
@override@JsonKey() List<TripWithDestination> get filteredTrips {
  if (_filteredTrips is EqualUnmodifiableListView) return _filteredTrips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTrips);
}

/// A dedicated state machine to track actions like adding/deleting an expense
/// or updating a trip. This prevents the whole UI from showing a loading spinner.
@override@JsonKey() final  ApiState<void> actionState;

/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyTripsStateCopyWith<_MyTripsState> get copyWith => __$MyTripsStateCopyWithImpl<_MyTripsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyTripsState&&(identical(other.tripsState, tripsState) || other.tripsState == tripsState)&&(identical(other.activeFilter, activeFilter) || other.activeFilter == activeFilter)&&const DeepCollectionEquality().equals(other._filteredTrips, _filteredTrips)&&(identical(other.actionState, actionState) || other.actionState == actionState));
}


@override
int get hashCode => Object.hash(runtimeType,tripsState,activeFilter,const DeepCollectionEquality().hash(_filteredTrips),actionState);

@override
String toString() {
  return 'MyTripsState(tripsState: $tripsState, activeFilter: $activeFilter, filteredTrips: $filteredTrips, actionState: $actionState)';
}


}

/// @nodoc
abstract mixin class _$MyTripsStateCopyWith<$Res> implements $MyTripsStateCopyWith<$Res> {
  factory _$MyTripsStateCopyWith(_MyTripsState value, $Res Function(_MyTripsState) _then) = __$MyTripsStateCopyWithImpl;
@override @useResult
$Res call({
 ApiState<List<TripWithDestination>> tripsState, TripFilter activeFilter, List<TripWithDestination> filteredTrips, ApiState<void> actionState
});


@override $ApiStateCopyWith<List<TripWithDestination>, $Res> get tripsState;@override $ApiStateCopyWith<void, $Res> get actionState;

}
/// @nodoc
class __$MyTripsStateCopyWithImpl<$Res>
    implements _$MyTripsStateCopyWith<$Res> {
  __$MyTripsStateCopyWithImpl(this._self, this._then);

  final _MyTripsState _self;
  final $Res Function(_MyTripsState) _then;

/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripsState = null,Object? activeFilter = null,Object? filteredTrips = null,Object? actionState = null,}) {
  return _then(_MyTripsState(
tripsState: null == tripsState ? _self.tripsState : tripsState // ignore: cast_nullable_to_non_nullable
as ApiState<List<TripWithDestination>>,activeFilter: null == activeFilter ? _self.activeFilter : activeFilter // ignore: cast_nullable_to_non_nullable
as TripFilter,filteredTrips: null == filteredTrips ? _self._filteredTrips : filteredTrips // ignore: cast_nullable_to_non_nullable
as List<TripWithDestination>,actionState: null == actionState ? _self.actionState : actionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}

/// Create a copy of MyTripsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<TripWithDestination>, $Res> get tripsState {
  
  return $ApiStateCopyWith<List<TripWithDestination>, $Res>(_self.tripsState, (value) {
    return _then(_self.copyWith(tripsState: value));
  });
}/// Create a copy of MyTripsState
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
