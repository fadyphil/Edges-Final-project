class WeatherDto {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String main;
  final String description;
  final String icon;

  WeatherDto({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      main: json['weather'][0]['main'] as String,
      description: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'main': {
        'temp': temperature,
        'feels_like': feelsLike,
        'humidity': humidity,
      },
      'wind': {'speed': windSpeed},
      'weather': [
        {'main': main, 'description': description, 'icon': icon},
      ],
    };
  }
}
