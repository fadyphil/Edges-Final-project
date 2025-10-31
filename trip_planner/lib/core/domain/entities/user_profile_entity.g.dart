// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  name: json['name'] as String,
  preferredCurrency: json['preferredCurrency'] as String,
  tavelInterests: (json['tavelInterests'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isDarkMode: json['isDarkMode'] as bool? ?? false,
  onboardingCompleted: json['onboardingCompleted'] as bool? ?? false,
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'preferredCurrency': instance.preferredCurrency,
      'tavelInterests': instance.tavelInterests,
      'isDarkMode': instance.isDarkMode,
      'onboardingCompleted': instance.onboardingCompleted,
    };
