import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/weather_entity.dart';
import 'package:trip_planner/core/domain/usecases/weather%20use%20%20cases/get_weather_use_case.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

class WeatherCubit extends Cubit<ApiState<Weather>> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherCubit(this.getWeatherUseCase) : super(ApiState.initial());

  Future<void> fetchWeather(double latitude, double longitude) async {
    emit(ApiState.loading());
    try {
      final weather = await getWeatherUseCase(latitude, longitude);
      emit(ApiState.success(data: weather));
    } catch (e) {
      emit(ApiState.error(message: 'Failed to fetch weather data  $e'));
    }
  }
}
