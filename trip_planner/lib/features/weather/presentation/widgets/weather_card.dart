// lib/presentation/widgets/weather_card.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/weather_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/weather/weather_cubit.dart';
import 'package:trip_planner/core/di/service_locator.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';

// ------------------- The Main Widget (Public Facing) -------------------
class WeatherCard extends StatelessWidget {
  final Destination destination;

  const WeatherCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    // This BlocProvider creates and provides the WeatherCubit to this specific widget's subtree.
    // It is the "trigger" for the entire data fetching process.
    return BlocProvider(
      create: (context) =>
          sl<WeatherCubit>() // Ask the service locator for a fresh cubit
            ..fetchWeather(
              destination.latitude,
              destination.longitude,
            ), // Immediately fetch weather
      child: const _WeatherCardView(),
    );
  }
}

// ------------------- The UI View (Private) -------------------
class _WeatherCardView extends StatelessWidget {
  const _WeatherCardView();

  @override
  Widget build(BuildContext context) {
    // This BlocBuilder listens to the cubit provided above and rebuilds the UI on state changes.
    return BlocBuilder<WeatherCubit, ApiState<Weather>>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state.when(
            initial: () => const _LoadingIndicator(key: ValueKey('initial')),
            loading: () => const _LoadingIndicator(key: ValueKey('loading')),
            error: (message) =>
                _ErrorView(key: ValueKey('error'), message: message),
            success: (weather) =>
                _SuccessCard(key: ValueKey('success'), weather: weather),
          ),
        );
      },
    );
  }
}

class _SuccessCard extends StatelessWidget {
  final Weather weather;
  const _SuccessCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final gradient = _getWeatherGradient(weather.main);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(color: Colors.white.withValues(alpha: .2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // --- Main Display: Icon and Temperature ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getWeatherIcon(weather.icon),
                      color: Colors.white,
                      size: 80,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weather.temperature.round()}°C',
                          style: const TextStyle(
                            fontSize: 56,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(blurRadius: 2, color: Colors.black26),
                            ],
                          ),
                        ),
                        Text(
                          weather.main,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white.withValues(alpha: .3)),
                const SizedBox(height: 16),
                // --- Secondary Stats ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatColumn(
                      label: 'Feels Like',
                      value: '${weather.feelsLike.round()}°C',
                    ),
                    _StatColumn(
                      label: 'Humidity',
                      value: '${weather.humidity}%',
                    ),
                    _StatColumn(
                      label: 'Wind',
                      value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255, // Match the approximate height of the success card
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 40),
              const SizedBox(height: 8),
              const Text(
                'Could not load weather',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ------------------- Helper Functions (Complete Implementation) -------------------

LinearGradient _getWeatherGradient(String weatherMain) {
  switch (weatherMain.toLowerCase()) {
    case 'clear':
      return LinearGradient(
        colors: [Colors.orange.shade700, Colors.yellow.shade600],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    case 'clouds':
      return LinearGradient(
        colors: [Colors.blueGrey.shade600, Colors.grey.shade700],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    case 'rain':
    case 'drizzle':
    case 'thunderstorm':
      return LinearGradient(
        colors: [Colors.indigo.shade700, Colors.blue.shade800],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    case 'snow':
      return LinearGradient(
        colors: [Colors.lightBlue.shade300, Colors.cyan.shade400],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    default: // Mist, Haze, etc.
      return LinearGradient(
        colors: [Colors.grey.shade600, Colors.blueGrey.shade500],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
  }
}

IconData _getWeatherIcon(String iconCode) {
  // Mapping based on OpenWeatherMap icon codes
  switch (iconCode.substring(0, 2)) {
    // We only need the number part
    case '01':
      return Icons.wb_sunny_rounded;
    case '02':
      return Icons.filter_drama_rounded;
    case '03':
      return Icons.cloud_outlined;
    case '04':
      return Icons.cloud_rounded;
    case '09':
      return Icons.grain_rounded;
    case '10':
      return Icons.beach_access_rounded;
    case '11':
      return Icons.flash_on_rounded;
    case '13':
      return Icons.ac_unit_rounded;
    case '50':
      return Icons.blur_on;
    default:
      return Icons.cloud_outlined;
  }
}
