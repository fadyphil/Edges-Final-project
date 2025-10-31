import 'package:trip_planner/core/domain/entities/weather_entity.dart';
import 'package:trip_planner/core/domain/repo/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  Future<Weather> call(double latitude, double longitude) async {
    return await _weatherRepository.getWeatherForLocation(latitude, longitude);
  }
}
