import 'dart:developer';

import 'package:trip_planner/core/data/local/exhange_rate_local_date_source.dart';
import 'package:trip_planner/core/data/models/exchange_rate_dto.dart';
import 'package:trip_planner/core/data/services/exchange_rate_remote_data_source.dart';
import 'package:trip_planner/core/domain/entities/exchange_rate_entity.dart';
import 'package:trip_planner/core/domain/repo/exchange_rate_repository.dart';

class ExchangeRateRepositoryImpl implements ExchangeRateRepository {
  final ExhangeRateLocalDateSource _localDataSource;
  final ExchangeRateRemoteDataSource _remoteDataSource;

  ExchangeRateRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<ExchangeRateEntity> getRates(String baseCurrency) async {
    try {
      // Try to get from cache first
      final cachedRates = await _localDataSource.getCachedExchangeRates(
        baseCurrency,
      );
      if (cachedRates != null) {
        return ExchangeRateEntity(
          baseCurrency: cachedRates.baseCurrency,
          rates: cachedRates.rates,
        );
      }

      // If not in cache or stale, fetch from remote
      final remoteData = await _remoteDataSource.fetchExchangeRates(
        baseCurrency,
      );
      final exchangeRateModel = ExchangeRatesModel.fromJson(remoteData);

      // Cache the new data
      await _localDataSource.cacheExchangeRates(exchangeRateModel);

      return ExchangeRateEntity(
        baseCurrency: exchangeRateModel.baseCurrency,
        rates: exchangeRateModel.rates,
      );
    } catch (e) {
      log(
        'Error fetching exchange rates: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return ExchangeRateEntity(baseCurrency: '', rates: {});
    }
  }
}
