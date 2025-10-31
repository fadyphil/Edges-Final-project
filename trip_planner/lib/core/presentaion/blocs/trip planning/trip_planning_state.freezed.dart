// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_planning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TripPlanningState {

// --- Form Fields ---
 String get tripName; DateTime? get startDate; DateTime? get endDate; String get budget; String get notes;// --- Currency Conversion State ---
// This holds the status of the API call for conversion
 ApiState<double> get conversionState;// This holds the final display string (e.g., "≈ 47,500.00 EGP")
 String get convertedAmountDisplay;// --- Form Validation & Submission State ---
 bool get isFormValid; ApiState<void> get submissionState;
/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TripPlanningStateCopyWith<TripPlanningState> get copyWith => _$TripPlanningStateCopyWithImpl<TripPlanningState>(this as TripPlanningState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TripPlanningState&&(identical(other.tripName, tripName) || other.tripName == tripName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.conversionState, conversionState) || other.conversionState == conversionState)&&(identical(other.convertedAmountDisplay, convertedAmountDisplay) || other.convertedAmountDisplay == convertedAmountDisplay)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.submissionState, submissionState) || other.submissionState == submissionState));
}


@override
int get hashCode => Object.hash(runtimeType,tripName,startDate,endDate,budget,notes,conversionState,convertedAmountDisplay,isFormValid,submissionState);

@override
String toString() {
  return 'TripPlanningState(tripName: $tripName, startDate: $startDate, endDate: $endDate, budget: $budget, notes: $notes, conversionState: $conversionState, convertedAmountDisplay: $convertedAmountDisplay, isFormValid: $isFormValid, submissionState: $submissionState)';
}


}

/// @nodoc
abstract mixin class $TripPlanningStateCopyWith<$Res>  {
  factory $TripPlanningStateCopyWith(TripPlanningState value, $Res Function(TripPlanningState) _then) = _$TripPlanningStateCopyWithImpl;
@useResult
$Res call({
 String tripName, DateTime? startDate, DateTime? endDate, String budget, String notes, ApiState<double> conversionState, String convertedAmountDisplay, bool isFormValid, ApiState<void> submissionState
});


$ApiStateCopyWith<double, $Res> get conversionState;$ApiStateCopyWith<void, $Res> get submissionState;

}
/// @nodoc
class _$TripPlanningStateCopyWithImpl<$Res>
    implements $TripPlanningStateCopyWith<$Res> {
  _$TripPlanningStateCopyWithImpl(this._self, this._then);

  final TripPlanningState _self;
  final $Res Function(TripPlanningState) _then;

/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tripName = null,Object? startDate = freezed,Object? endDate = freezed,Object? budget = null,Object? notes = null,Object? conversionState = null,Object? convertedAmountDisplay = null,Object? isFormValid = null,Object? submissionState = null,}) {
  return _then(_self.copyWith(
tripName: null == tripName ? _self.tripName : tripName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,conversionState: null == conversionState ? _self.conversionState : conversionState // ignore: cast_nullable_to_non_nullable
as ApiState<double>,convertedAmountDisplay: null == convertedAmountDisplay ? _self.convertedAmountDisplay : convertedAmountDisplay // ignore: cast_nullable_to_non_nullable
as String,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,submissionState: null == submissionState ? _self.submissionState : submissionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}
/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<double, $Res> get conversionState {
  
  return $ApiStateCopyWith<double, $Res>(_self.conversionState, (value) {
    return _then(_self.copyWith(conversionState: value));
  });
}/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get submissionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.submissionState, (value) {
    return _then(_self.copyWith(submissionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [TripPlanningState].
extension TripPlanningStatePatterns on TripPlanningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TripPlanningState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TripPlanningState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TripPlanningState value)  $default,){
final _that = this;
switch (_that) {
case _TripPlanningState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TripPlanningState value)?  $default,){
final _that = this;
switch (_that) {
case _TripPlanningState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tripName,  DateTime? startDate,  DateTime? endDate,  String budget,  String notes,  ApiState<double> conversionState,  String convertedAmountDisplay,  bool isFormValid,  ApiState<void> submissionState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TripPlanningState() when $default != null:
return $default(_that.tripName,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.conversionState,_that.convertedAmountDisplay,_that.isFormValid,_that.submissionState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tripName,  DateTime? startDate,  DateTime? endDate,  String budget,  String notes,  ApiState<double> conversionState,  String convertedAmountDisplay,  bool isFormValid,  ApiState<void> submissionState)  $default,) {final _that = this;
switch (_that) {
case _TripPlanningState():
return $default(_that.tripName,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.conversionState,_that.convertedAmountDisplay,_that.isFormValid,_that.submissionState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tripName,  DateTime? startDate,  DateTime? endDate,  String budget,  String notes,  ApiState<double> conversionState,  String convertedAmountDisplay,  bool isFormValid,  ApiState<void> submissionState)?  $default,) {final _that = this;
switch (_that) {
case _TripPlanningState() when $default != null:
return $default(_that.tripName,_that.startDate,_that.endDate,_that.budget,_that.notes,_that.conversionState,_that.convertedAmountDisplay,_that.isFormValid,_that.submissionState);case _:
  return null;

}
}

}

/// @nodoc


class _TripPlanningState implements TripPlanningState {
  const _TripPlanningState({this.tripName = '', this.startDate, this.endDate, this.budget = '', this.notes = '', this.conversionState = const ApiState.initial(), this.convertedAmountDisplay = '', this.isFormValid = false, this.submissionState = const ApiState.initial()});
  

// --- Form Fields ---
@override@JsonKey() final  String tripName;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  String budget;
@override@JsonKey() final  String notes;
// --- Currency Conversion State ---
// This holds the status of the API call for conversion
@override@JsonKey() final  ApiState<double> conversionState;
// This holds the final display string (e.g., "≈ 47,500.00 EGP")
@override@JsonKey() final  String convertedAmountDisplay;
// --- Form Validation & Submission State ---
@override@JsonKey() final  bool isFormValid;
@override@JsonKey() final  ApiState<void> submissionState;

/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TripPlanningStateCopyWith<_TripPlanningState> get copyWith => __$TripPlanningStateCopyWithImpl<_TripPlanningState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TripPlanningState&&(identical(other.tripName, tripName) || other.tripName == tripName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.conversionState, conversionState) || other.conversionState == conversionState)&&(identical(other.convertedAmountDisplay, convertedAmountDisplay) || other.convertedAmountDisplay == convertedAmountDisplay)&&(identical(other.isFormValid, isFormValid) || other.isFormValid == isFormValid)&&(identical(other.submissionState, submissionState) || other.submissionState == submissionState));
}


@override
int get hashCode => Object.hash(runtimeType,tripName,startDate,endDate,budget,notes,conversionState,convertedAmountDisplay,isFormValid,submissionState);

@override
String toString() {
  return 'TripPlanningState(tripName: $tripName, startDate: $startDate, endDate: $endDate, budget: $budget, notes: $notes, conversionState: $conversionState, convertedAmountDisplay: $convertedAmountDisplay, isFormValid: $isFormValid, submissionState: $submissionState)';
}


}

/// @nodoc
abstract mixin class _$TripPlanningStateCopyWith<$Res> implements $TripPlanningStateCopyWith<$Res> {
  factory _$TripPlanningStateCopyWith(_TripPlanningState value, $Res Function(_TripPlanningState) _then) = __$TripPlanningStateCopyWithImpl;
@override @useResult
$Res call({
 String tripName, DateTime? startDate, DateTime? endDate, String budget, String notes, ApiState<double> conversionState, String convertedAmountDisplay, bool isFormValid, ApiState<void> submissionState
});


@override $ApiStateCopyWith<double, $Res> get conversionState;@override $ApiStateCopyWith<void, $Res> get submissionState;

}
/// @nodoc
class __$TripPlanningStateCopyWithImpl<$Res>
    implements _$TripPlanningStateCopyWith<$Res> {
  __$TripPlanningStateCopyWithImpl(this._self, this._then);

  final _TripPlanningState _self;
  final $Res Function(_TripPlanningState) _then;

/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tripName = null,Object? startDate = freezed,Object? endDate = freezed,Object? budget = null,Object? notes = null,Object? conversionState = null,Object? convertedAmountDisplay = null,Object? isFormValid = null,Object? submissionState = null,}) {
  return _then(_TripPlanningState(
tripName: null == tripName ? _self.tripName : tripName // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,conversionState: null == conversionState ? _self.conversionState : conversionState // ignore: cast_nullable_to_non_nullable
as ApiState<double>,convertedAmountDisplay: null == convertedAmountDisplay ? _self.convertedAmountDisplay : convertedAmountDisplay // ignore: cast_nullable_to_non_nullable
as String,isFormValid: null == isFormValid ? _self.isFormValid : isFormValid // ignore: cast_nullable_to_non_nullable
as bool,submissionState: null == submissionState ? _self.submissionState : submissionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}

/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<double, $Res> get conversionState {
  
  return $ApiStateCopyWith<double, $Res>(_self.conversionState, (value) {
    return _then(_self.copyWith(conversionState: value));
  });
}/// Create a copy of TripPlanningState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get submissionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.submissionState, (value) {
    return _then(_self.copyWith(submissionState: value));
  });
}
}

// dart format on
