import 'package:trip_planner/core/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherForLocation(double latitude, double longitude);
}
