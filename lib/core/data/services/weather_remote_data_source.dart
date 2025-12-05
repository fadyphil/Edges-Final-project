import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trip_planner/core/data/models/weather_dto.dart';

class WeatherRemoteDataSource {
  final Dio _dio;

  WeatherRemoteDataSource(this._dio);

  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherDto> fetchWeather(double latitude, double longitude) async {
    try {
      final apiKey = dotenv.env['OPENWEATHER_API_KEY'];
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
          'units': 'metric',
        },
      );

      return WeatherDto.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch weather: ${e.message}');
    }
  }
}
