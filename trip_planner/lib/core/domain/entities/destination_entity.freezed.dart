// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Destination {

 String get id; String get name; String get capital; String get region; int get population; List<String> get languages; Currency get currency; String get flagUrl; List<String> get imageUrls; String get timezone; double get latitude; double get longitude; String get currencyCode;
/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DestinationCopyWith<Destination> get copyWith => _$DestinationCopyWithImpl<Destination>(this as Destination, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Destination&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.region, region) || other.region == region)&&(identical(other.population, population) || other.population == population)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,capital,region,population,const DeepCollectionEquality().hash(languages),currency,flagUrl,const DeepCollectionEquality().hash(imageUrls),timezone,latitude,longitude,currencyCode);

@override
String toString() {
  return 'Destination(id: $id, name: $name, capital: $capital, region: $region, population: $population, languages: $languages, currency: $currency, flagUrl: $flagUrl, imageUrls: $imageUrls, timezone: $timezone, latitude: $latitude, longitude: $longitude, currencyCode: $currencyCode)';
}


}

/// @nodoc
abstract mixin class $DestinationCopyWith<$Res>  {
  factory $DestinationCopyWith(Destination value, $Res Function(Destination) _then) = _$DestinationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String capital, String region, int population, List<String> languages, Currency currency, String flagUrl, List<String> imageUrls, String timezone, double latitude, double longitude, String currencyCode
});


$CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class _$DestinationCopyWithImpl<$Res>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._self, this._then);

  final Destination _self;
  final $Res Function(Destination) _then;

/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? capital = null,Object? region = null,Object? population = null,Object? languages = null,Object? currency = null,Object? flagUrl = null,Object? imageUrls = null,Object? timezone = null,Object? latitude = null,Object? longitude = null,Object? currencyCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,population: null == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,flagUrl: null == flagUrl ? _self.flagUrl : flagUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}


/// Adds pattern-matching-related methods to [Destination].
extension DestinationPatterns on Destination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Destination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Destination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Destination value)  $default,){
final _that = this;
switch (_that) {
case _Destination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Destination value)?  $default,){
final _that = this;
switch (_that) {
case _Destination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String capital,  String region,  int population,  List<String> languages,  Currency currency,  String flagUrl,  List<String> imageUrls,  String timezone,  double latitude,  double longitude,  String currencyCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Destination() when $default != null:
return $default(_that.id,_that.name,_that.capital,_that.region,_that.population,_that.languages,_that.currency,_that.flagUrl,_that.imageUrls,_that.timezone,_that.latitude,_that.longitude,_that.currencyCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String capital,  String region,  int population,  List<String> languages,  Currency currency,  String flagUrl,  List<String> imageUrls,  String timezone,  double latitude,  double longitude,  String currencyCode)  $default,) {final _that = this;
switch (_that) {
case _Destination():
return $default(_that.id,_that.name,_that.capital,_that.region,_that.population,_that.languages,_that.currency,_that.flagUrl,_that.imageUrls,_that.timezone,_that.latitude,_that.longitude,_that.currencyCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String capital,  String region,  int population,  List<String> languages,  Currency currency,  String flagUrl,  List<String> imageUrls,  String timezone,  double latitude,  double longitude,  String currencyCode)?  $default,) {final _that = this;
switch (_that) {
case _Destination() when $default != null:
return $default(_that.id,_that.name,_that.capital,_that.region,_that.population,_that.languages,_that.currency,_that.flagUrl,_that.imageUrls,_that.timezone,_that.latitude,_that.longitude,_that.currencyCode);case _:
  return null;

}
}

}

/// @nodoc


class _Destination implements Destination {
  const _Destination({required this.id, required this.name, required this.capital, required this.region, required this.population, required final  List<String> languages, required this.currency, required this.flagUrl, required final  List<String> imageUrls, required this.timezone, required this.latitude, required this.longitude, required this.currencyCode}): _languages = languages,_imageUrls = imageUrls;
  

@override final  String id;
@override final  String name;
@override final  String capital;
@override final  String region;
@override final  int population;
 final  List<String> _languages;
@override List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  Currency currency;
@override final  String flagUrl;
 final  List<String> _imageUrls;
@override List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  String timezone;
@override final  double latitude;
@override final  double longitude;
@override final  String currencyCode;

/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DestinationCopyWith<_Destination> get copyWith => __$DestinationCopyWithImpl<_Destination>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Destination&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.capital, capital) || other.capital == capital)&&(identical(other.region, region) || other.region == region)&&(identical(other.population, population) || other.population == population)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,capital,region,population,const DeepCollectionEquality().hash(_languages),currency,flagUrl,const DeepCollectionEquality().hash(_imageUrls),timezone,latitude,longitude,currencyCode);

@override
String toString() {
  return 'Destination(id: $id, name: $name, capital: $capital, region: $region, population: $population, languages: $languages, currency: $currency, flagUrl: $flagUrl, imageUrls: $imageUrls, timezone: $timezone, latitude: $latitude, longitude: $longitude, currencyCode: $currencyCode)';
}


}

/// @nodoc
abstract mixin class _$DestinationCopyWith<$Res> implements $DestinationCopyWith<$Res> {
  factory _$DestinationCopyWith(_Destination value, $Res Function(_Destination) _then) = __$DestinationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String capital, String region, int population, List<String> languages, Currency currency, String flagUrl, List<String> imageUrls, String timezone, double latitude, double longitude, String currencyCode
});


@override $CurrencyCopyWith<$Res> get currency;

}
/// @nodoc
class __$DestinationCopyWithImpl<$Res>
    implements _$DestinationCopyWith<$Res> {
  __$DestinationCopyWithImpl(this._self, this._then);

  final _Destination _self;
  final $Res Function(_Destination) _then;

/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? capital = null,Object? region = null,Object? population = null,Object? languages = null,Object? currency = null,Object? flagUrl = null,Object? imageUrls = null,Object? timezone = null,Object? latitude = null,Object? longitude = null,Object? currencyCode = null,}) {
  return _then(_Destination(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,capital: null == capital ? _self.capital : capital // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,population: null == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,flagUrl: null == flagUrl ? _self.flagUrl : flagUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,currencyCode: null == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Destination
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrencyCopyWith<$Res> get currency {
  
  return $CurrencyCopyWith<$Res>(_self.currency, (value) {
    return _then(_self.copyWith(currency: value));
  });
}
}

// dart format on
