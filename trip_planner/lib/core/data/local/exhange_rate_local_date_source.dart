import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/core/data/models/exchange_rate_dto.dart';

abstract class ExhangeRateLocalDateSource {
  Future<void> cacheExchangeRates(ExchangeRatesModel exchangeRates);
  Future<ExchangeRatesModel?> getCachedExchangeRates(String baseCurrency);
  Future<void> clearAll();
}

class ExhangeRateLocalDateSourceImpl implements ExhangeRateLocalDateSource {
  final SharedPreferences _prefs;
  final validity = const Duration(hours: 24);
  ExhangeRateLocalDateSourceImpl(this._prefs);

  String _generateCacheKey(String baseCurrency) =>
      'cached_exchange_rates_$baseCurrency';

  @override
  Future<void> cacheExchangeRates(ExchangeRatesModel exchangeRates) async {
    try {
      final cacheKey = _generateCacheKey(exchangeRates.baseCurrency);
      final jsonString = json.encode(exchangeRates.toJson());
      await _prefs.setString(cacheKey, jsonString);
    } catch (e) {
      log(
        'Error caching exchange rates: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<ExchangeRatesModel?> getCachedExchangeRates(
    String baseCurrency,
  ) async {
    try {
      final key = _generateCacheKey(baseCurrency);
      final jsonString = _prefs.getString(key);
      if (jsonString == null) {
        return null;
      }

      final model = ExchangeRatesModel.fromCacheJson(json.decode(jsonString));
      final isStale = DateTime.now().difference(model.lastUpdate) > validity;

      if (isStale) {
        await _prefs.remove(key);
        return null;
      }

      return model;
    } catch (e) {
      log(' iddk', error: e, stackTrace: StackTrace.current);
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      final keys = _prefs.getKeys();
      for (final key in keys) {
        if (key.startsWith('cached_exchange_rates_')) {
          await _prefs.remove(key);
        }
      }
    } catch (e) {
      log(
        'Error clearing exchange rates: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
