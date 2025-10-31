// lib/core/domain/entities/weather_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    /// Current temperature in Celsius.
    required double temperature,

    /// "Feels like" temperature in Celsius.
    required double feelsLike,

    /// Humidity percentage (e.g., 81).
    required int humidity,

    /// Wind speed in meter/sec.
    required double windSpeed,

    /// Main weather condition (e.g., "Clouds", "Rain", "Clear").
    required String main,

    /// More detailed description (e.g., "overcast clouds").
    required String description,

    /// Weather icon code from the API (e.g., "04d").
    /// The UI will use this to select the correct visual icon.
    required String icon,
  }) = _Weather;
}