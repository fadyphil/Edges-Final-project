import 'package:trip_planner/core/data/models/weather_dto.dart';
import 'package:trip_planner/core/domain/entities/weather_entity.dart';

class WeatherMapper {
  static Weather fromDto(WeatherDto dto) {
    return Weather(
      temperature: dto.temperature,
      feelsLike: dto.feelsLike,
      humidity: dto.humidity,
      windSpeed: dto.windSpeed,
      main: dto.main,
      description: dto.description,
      icon: dto.icon,
    );
  }

  static WeatherDto toDto(Weather entity) {
    return WeatherDto(
      temperature: entity.temperature,
      feelsLike: entity.feelsLike,
      humidity: entity.humidity,
      windSpeed: entity.windSpeed,
      main: entity.main,
      description: entity.description,
      icon: entity.icon,
    );
  }
}
