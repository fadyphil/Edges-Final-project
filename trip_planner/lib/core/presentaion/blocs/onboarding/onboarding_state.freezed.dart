// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

// Tracks the current page of the PageView (0, 1, 2)
 int get currentStep;// --- Data gathered from the user ---
 String get name; String get currency;// Default to USD
 List<String> get interests;// --- UI Control Flags ---
// Controls the enabled/disabled state of the 'Continue' button
 bool get canContinue;// Manages the state of the final save operation
 ApiState<void> get submissionState;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.canContinue, canContinue) || other.canContinue == canContinue)&&(identical(other.submissionState, submissionState) || other.submissionState == submissionState));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,name,currency,const DeepCollectionEquality().hash(interests),canContinue,submissionState);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, name: $name, currency: $currency, interests: $interests, canContinue: $canContinue, submissionState: $submissionState)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 int currentStep, String name, String currency, List<String> interests, bool canContinue, ApiState<void> submissionState
});


$ApiStateCopyWith<void, $Res> get submissionState;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? name = null,Object? currency = null,Object? interests = null,Object? canContinue = null,Object? submissionState = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,canContinue: null == canContinue ? _self.canContinue : canContinue // ignore: cast_nullable_to_non_nullable
as bool,submissionState: null == submissionState ? _self.submissionState : submissionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiStateCopyWith<void, $Res> get submissionState {
  
  return $ApiStateCopyWith<void, $Res>(_self.submissionState, (value) {
    return _then(_self.copyWith(submissionState: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentStep,  String name,  String currency,  List<String> interests,  bool canContinue,  ApiState<void> submissionState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.name,_that.currency,_that.interests,_that.canContinue,_that.submissionState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentStep,  String name,  String currency,  List<String> interests,  bool canContinue,  ApiState<void> submissionState)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.currentStep,_that.name,_that.currency,_that.interests,_that.canContinue,_that.submissionState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentStep,  String name,  String currency,  List<String> interests,  bool canContinue,  ApiState<void> submissionState)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.currentStep,_that.name,_that.currency,_that.interests,_that.canContinue,_that.submissionState);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.currentStep = 0, this.name = '', this.currency = 'USD', final  List<String> interests = const [], this.canContinue = false, this.submissionState = const ApiState.initial()}): _interests = interests;
  

// Tracks the current page of the PageView (0, 1, 2)
@override@JsonKey() final  int currentStep;
// --- Data gathered from the user ---
@override@JsonKey() final  String name;
@override@JsonKey() final  String currency;
// Default to USD
 final  List<String> _interests;
// Default to USD
@override@JsonKey() List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

// --- UI Control Flags ---
// Controls the enabled/disabled state of the 'Continue' button
@override@JsonKey() final  bool canContinue;
// Manages the state of the final save operation
@override@JsonKey() final  ApiState<void> submissionState;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.canContinue, canContinue) || other.canContinue == canContinue)&&(identical(other.submissionState, submissionState) || other.submissionState == submissionState));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,name,currency,const DeepCollectionEquality().hash(_interests),canContinue,submissionState);

@override
String toString() {
  return 'OnboardingState(currentStep: $currentStep, name: $name, currency: $currency, interests: $interests, canContinue: $canContinue, submissionState: $submissionState)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 int currentStep, String name, String currency, List<String> interests, bool canContinue, ApiState<void> submissionState
});


@override $ApiStateCopyWith<void, $Res> get submissionState;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? name = null,Object? currency = null,Object? interests = null,Object? canContinue = null,Object? submissionState = null,}) {
  return _then(_OnboardingState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,canContinue: null == canContinue ? _self.canContinue : canContinue // ignore: cast_nullable_to_non_nullable
as bool,submissionState: null == submissionState ? _self.submissionState : submissionState // ignore: cast_nullable_to_non_nullable
as ApiState<void>,
  ));
}

/// Create a copy of OnboardingState
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
