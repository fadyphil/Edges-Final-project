// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Trip {

 String get id;// A unique identifier for this specific trip
 String get tripName; String get destinationId;// The ID of the Destination this trip is for
 DateTime get startDate; DateTime get endDate; Budget get budget;// Using a Value Object
 String get notes; bool get isCompleted; List<Expense> get expenses;
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripCopyWith<Trip> get copyWith => _$TripCopyWithImpl<Trip>(this as Trip, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.tripName, tripName) || other.tripName == tripName)&&(identical(other.destinationId, destinationId) || other.destinationId == destinationId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other.expenses, expenses));
}


@override
int get hashCode => Object.hash(runtimeType,id,tripName,destinationId,startDate,endDate,budget,notes,isCompleted,const DeepCollectionEquality().hash(expenses));

@override
String toString() {
  return 'Trip(id: $id, tripName: $tripName, destinationId: $destinationId, startDate: $startDate, endDate: $endDate, budget: $budget, notes: $notes, isCompleted: $isCompleted, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class $TripCopyWith<$Res>  {
  factory $TripCopyWith(Trip value, $Res Function(Trip) _then) = _$TripCopyWithImpl;
@useResult
$Res call({
 String id, String tripName, String destinationId, DateTime startDate, DateTime endDate, Budget budget, String notes, bool isCompleted, List<Expense> expenses
});


$BudgetCopyWith<$Res> get budget;

}
/// @nodoc
class _$TripCopyWithImpl<$Res>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._self, this._then);

  final Trip _self;
  final $Res Function(Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tripName = null,Object? destinationId = null,Object? startDate = null,Object? endDate = null,Object? budget = null,Object? notes = null,Object? isCompleted = null,Object? expenses = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripName: null == tripName ? _self.tripName : tripName // ignore: cast_nullable_to_non_nullable
as String,destinationId: null == destinationId ? _self.destinationId : destinationId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as Budget,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,
  ));
}
/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetCopyWith<$Res> get budget {
  
  return $BudgetCopyWith<$Res>(_self.budget, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}


/// Adds pattern-matching-related methods to [Trip].
extension TripPatterns on Trip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Trip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Trip value)  $default,){
final _that = this;
switch (_that) {
case _Trip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Trip value)?  $default,){
final _that = this;
switch (_that) {
case _Trip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tripName,  String destinationId,  DateTime startDate,  DateTime endDate,  Budget budget,  String notes,  bool isCompleted,  List<Expense> expenses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.tripName,_that.destinationId,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.isCompleted,_that.expenses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tripName,  String destinationId,  DateTime startDate,  DateTime endDate,  Budget budget,  String notes,  bool isCompleted,  List<Expense> expenses)  $default,) {final _that = this;
switch (_that) {
case _Trip():
return $default(_that.id,_that.tripName,_that.destinationId,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.isCompleted,_that.expenses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tripName,  String destinationId,  DateTime startDate,  DateTime endDate,  Budget budget,  String notes,  bool isCompleted,  List<Expense> expenses)?  $default,) {final _that = this;
switch (_that) {
case _Trip() when $default != null:
return $default(_that.id,_that.tripName,_that.destinationId,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.isCompleted,_that.expenses);case _:
  return null;

}
}

}

/// @nodoc


class _Trip implements Trip {
  const _Trip({required this.id, required this.tripName, required this.destinationId, required this.startDate, required this.endDate, required this.budget, required this.notes, required this.isCompleted, required final  List<Expense> expenses}): _expenses = expenses;
  

@override final  String id;
// A unique identifier for this specific trip
@override final  String tripName;
@override final  String destinationId;
// The ID of the Destination this trip is for
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  Budget budget;
// Using a Value Object
@override final  String notes;
@override final  bool isCompleted;
 final  List<Expense> _expenses;
@override List<Expense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}


/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripCopyWith<_Trip> get copyWith => __$TripCopyWithImpl<_Trip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Trip&&(identical(other.id, id) || other.id == id)&&(identical(other.tripName, tripName) || other.tripName == tripName)&&(identical(other.destinationId, destinationId) || other.destinationId == destinationId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&const DeepCollectionEquality().equals(other._expenses, _expenses));
}


@override
int get hashCode => Object.hash(runtimeType,id,tripName,destinationId,startDate,endDate,budget,notes,isCompleted,const DeepCollectionEquality().hash(_expenses));

@override
String toString() {
  return 'Trip(id: $id, tripName: $tripName, destinationId: $destinationId, startDate: $startDate, endDate: $endDate, budget: $budget, notes: $notes, isCompleted: $isCompleted, expenses: $expenses)';
}


}

/// @nodoc
abstract mixin class _$TripCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$TripCopyWith(_Trip value, $Res Function(_Trip) _then) = __$TripCopyWithImpl;
@override @useResult
$Res call({
 String id, String tripName, String destinationId, DateTime startDate, DateTime endDate, Budget budget, String notes, bool isCompleted, List<Expense> expenses
});


@override $BudgetCopyWith<$Res> get budget;

}
/// @nodoc
class __$TripCopyWithImpl<$Res>
    implements _$TripCopyWith<$Res> {
  __$TripCopyWithImpl(this._self, this._then);

  final _Trip _self;
  final $Res Function(_Trip) _then;

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tripName = null,Object? destinationId = null,Object? startDate = null,Object? endDate = null,Object? budget = null,Object? notes = null,Object? isCompleted = null,Object? expenses = null,}) {
  return _then(_Trip(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tripName: null == tripName ? _self.tripName : tripName // ignore: cast_nullable_to_non_nullable
as String,destinationId: null == destinationId ? _self.destinationId : destinationId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as Budget,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<Expense>,
  ));
}

/// Create a copy of Trip
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetCopyWith<$Res> get budget {
  
  return $BudgetCopyWith<$Res>(_self.budget, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}

// dart format on
