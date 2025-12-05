import 'dart:developer';

import 'package:trip_planner/core/data/mapping/weather_mapper.dart';
import 'package:trip_planner/core/data/services/weather_remote_data_source.dart';
import 'package:trip_planner/core/domain/entities/weather_entity.dart';
import 'package:trip_planner/core/domain/repo/weather_repository.dart';

class WeatherRemoteRepository implements WeatherRepository {
  final WeatherRemoteDataSource apiService;

  WeatherRemoteRepository(this.apiService);

  @override
  Future<Weather> getWeatherForLocation(
    double latitude,
    double longitude,
  ) async {
    try {
      final weather = await apiService.fetchWeather(latitude, longitude);
      return WeatherMapper.fromDto(weather);
    } catch (e) {
      log(
        '❌ ERROR in WeatherRemoteRepository: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      // On failure, return a default/empty Weather object to prevent the UI from crashing.
      return const Weather(
        temperature: 0,
        feelsLike: 0,
        humidity: 0,
        windSpeed: 0,
        main: 'Error',
        description: 'Could not fetch data',
        icon: '01d',
      );
    }
  }
}
