// lib/core/data/dtos/exchange_rates_model.dart

// This model serves as both a DTO and a Cache Entity.
class ExchangeRatesModel {
  final String baseCurrency;
  final Map<String, double> rates;
  final DateTime lastUpdate;

  ExchangeRatesModel({
    required this.baseCurrency,
    required this.rates,
    required this.lastUpdate,
  });

  // Factory to parse the JSON from the API
  factory ExchangeRatesModel.fromJson(Map<String, dynamic> json) {
    // The API returns rates with mixed types (int/double), so we must handle this.
    final ratesData = json['conversion_rates'] as Map<String, dynamic>;
    final rates = ratesData.map((key, value) {
      return MapEntry(key, (value as num).toDouble());
    });

    return ExchangeRatesModel(
      baseCurrency: json['base_code'] ?? 'USD',
      rates: rates,
      // When we create from the API, we set the update time to now.
      lastUpdate: DateTime.now(),
    );
  }

  // Factory to create an instance from a cached JSON string (from shared_preferences)
  factory ExchangeRatesModel.fromCacheJson(Map<String, dynamic> json) {
    final ratesData = json['rates'] as Map<String, dynamic>;
    final rates = ratesData.map((key, value) {
      return MapEntry(key, (value as num).toDouble());
    });

    return ExchangeRatesModel(
      baseCurrency: json['baseCurrency'],
      rates: rates,
      // We parse the timestamp from the cached data.
      lastUpdate: DateTime.parse(json['lastUpdate']),
    );
  }

  // Method to convert this model to a JSON map for storing in the cache
  Map<String, dynamic> toJson() {
    return {
      'baseCurrency': baseCurrency,
      'rates': rates,
      'lastUpdate': lastUpdate.toIso8601String(),
    };
  }
}
