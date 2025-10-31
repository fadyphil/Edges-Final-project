// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {

/// Manages the loading state for the main API call.
 ApiState<List<Destination>> get destinations;/// Holds the original, unfiltered list of all destinations from the API.
 List<Destination> get allDestinations;/// The currently active category filter (e.g., "Beach", "Popular").
 String get activeFilter;/// The current text in the search bar.
 String get searchQuery;/// The final, filtered list of destinations to be displayed in the UI grid.
 List<Destination> get filteredDestinations;
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateCopyWith<ExploreState> get copyWith => _$ExploreStateCopyWithImpl<ExploreState>(this as ExploreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState&&(identical(other.destinations, destinations) || other.destinations == destinations)&&const DeepCollectionEquality().equals(other.allDestinations, allDestinations)&&(identical(other.activeFilter, activeFilter) || other.activeFilter == activeFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.filteredDestinations, filteredDestinations));
}


@override
int get hashCode => Object.hash(runtimeType,destinations,const DeepCollectionEquality().hash(allDestinations),activeFilter,searchQuery,const DeepCollectionEquality().hash(filteredDestinations));

@override
String toString() {
  return 'ExploreState(destinations: $destinations, allDestinations: $allDestinations, activeFilter: $activeFilter, searchQuery: $searchQuery, filteredDestinations: $filteredDestinations)';
}


}

/// @nodoc
abstract mixin class $ExploreStateCopyWith<$Res>  {
  factory $ExploreStateCopyWith(ExploreState value, $Res Function(ExploreState) _then) = _$ExploreStateCopyWithImpl;
@useResult
$Res call({
 ApiState<List<Destination>> destinations, List<Destination> allDestinations, String activeFilter, String searchQuery, List<Destination> filteredDestinations
});


$ApiStateCopyWith<List<Destination>, $Res> get destinations;

}
/// @nodoc
class _$ExploreStateCopyWithImpl<$Res>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._self, this._then);

  final ExploreState _self;
  final $Res Function(ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destinations = null,Object? allDestinations = null,Object? activeFilter = null,Object? searchQuery = null,Object? filteredDestinations = null,}) {
  return _then(_self.copyWith(
destinations: null == destinations ? _self.destinations : destinations // ignore: cast_nullable_to_non_nullable
as ApiState<List<Destination>>,allDestinations: null == allDestinations ? _self.allDestinations : allDestinations // ignore: cast_nullable_to_non_nullable
as List<Destination>,activeFilter: null == activeFilter ? _self.activeFilter : activeFilter // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filteredDestinations: null == filteredDestinations ? _self.filteredDestinations : filteredDestinations // ignore: cast_nullable_to_non_nullable
as List<Destination>,
  ));
}
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<Destination>, $Res> get destinations {
  
  return $ApiStateCopyWith<List<Destination>, $Res>(_self.destinations, (value) {
    return _then(_self.copyWith(destinations: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreState value)  $default,){
final _that = this;
switch (_that) {
case _ExploreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreState value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApiState<List<Destination>> destinations,  List<Destination> allDestinations,  String activeFilter,  String searchQuery,  List<Destination> filteredDestinations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.destinations,_that.allDestinations,_that.activeFilter,_that.searchQuery,_that.filteredDestinations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApiState<List<Destination>> destinations,  List<Destination> allDestinations,  String activeFilter,  String searchQuery,  List<Destination> filteredDestinations)  $default,) {final _that = this;
switch (_that) {
case _ExploreState():
return $default(_that.destinations,_that.allDestinations,_that.activeFilter,_that.searchQuery,_that.filteredDestinations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApiState<List<Destination>> destinations,  List<Destination> allDestinations,  String activeFilter,  String searchQuery,  List<Destination> filteredDestinations)?  $default,) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.destinations,_that.allDestinations,_that.activeFilter,_that.searchQuery,_that.filteredDestinations);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreState implements ExploreState {
  const _ExploreState({this.destinations = const ApiState.initial(), final  List<Destination> allDestinations = const [], this.activeFilter = 'Popular', this.searchQuery = '', final  List<Destination> filteredDestinations = const []}): _allDestinations = allDestinations,_filteredDestinations = filteredDestinations;
  

/// Manages the loading state for the main API call.
@override@JsonKey() final  ApiState<List<Destination>> destinations;
/// Holds the original, unfiltered list of all destinations from the API.
 final  List<Destination> _allDestinations;
/// Holds the original, unfiltered list of all destinations from the API.
@override@JsonKey() List<Destination> get allDestinations {
  if (_allDestinations is EqualUnmodifiableListView) return _allDestinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allDestinations);
}

/// The currently active category filter (e.g., "Beach", "Popular").
@override@JsonKey() final  String activeFilter;
/// The current text in the search bar.
@override@JsonKey() final  String searchQuery;
/// The final, filtered list of destinations to be displayed in the UI grid.
 final  List<Destination> _filteredDestinations;
/// The final, filtered list of destinations to be displayed in the UI grid.
@override@JsonKey() List<Destination> get filteredDestinations {
  if (_filteredDestinations is EqualUnmodifiableListView) return _filteredDestinations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredDestinations);
}


/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreStateCopyWith<_ExploreState> get copyWith => __$ExploreStateCopyWithImpl<_ExploreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreState&&(identical(other.destinations, destinations) || other.destinations == destinations)&&const DeepCollectionEquality().equals(other._allDestinations, _allDestinations)&&(identical(other.activeFilter, activeFilter) || other.activeFilter == activeFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._filteredDestinations, _filteredDestinations));
}


@override
int get hashCode => Object.hash(runtimeType,destinations,const DeepCollectionEquality().hash(_allDestinations),activeFilter,searchQuery,const DeepCollectionEquality().hash(_filteredDestinations));

@override
String toString() {
  return 'ExploreState(destinations: $destinations, allDestinations: $allDestinations, activeFilter: $activeFilter, searchQuery: $searchQuery, filteredDestinations: $filteredDestinations)';
}


}

/// @nodoc
abstract mixin class _$ExploreStateCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory _$ExploreStateCopyWith(_ExploreState value, $Res Function(_ExploreState) _then) = __$ExploreStateCopyWithImpl;
@override @useResult
$Res call({
 ApiState<List<Destination>> destinations, List<Destination> allDestinations, String activeFilter, String searchQuery, List<Destination> filteredDestinations
});


@override $ApiStateCopyWith<List<Destination>, $Res> get destinations;

}
/// @nodoc
class __$ExploreStateCopyWithImpl<$Res>
    implements _$ExploreStateCopyWith<$Res> {
  __$ExploreStateCopyWithImpl(this._self, this._then);

  final _ExploreState _self;
  final $Res Function(_ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destinations = null,Object? allDestinations = null,Object? activeFilter = null,Object? searchQuery = null,Object? filteredDestinations = null,}) {
  return _then(_ExploreState(
destinations: null == destinations ? _self.destinations : destinations // ignore: cast_nullable_to_non_nullable
as ApiState<List<Destination>>,allDestinations: null == allDestinations ? _self._allDestinations : allDestinations // ignore: cast_nullable_to_non_nullable
as List<Destination>,activeFilter: null == activeFilter ? _self.activeFilter : activeFilter // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filteredDestinations: null == filteredDestinations ? _self._filteredDestinations : filteredDestinations // ignore: cast_nullable_to_non_nullable
as List<Destination>,
  ));
}

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<List<Destination>, $Res> get destinations {
  
  return $ApiStateCopyWith<List<Destination>, $Res>(_self.destinations, (value) {
    return _then(_self.copyWith(destinations: value));
  });
}
}

// dart format on
