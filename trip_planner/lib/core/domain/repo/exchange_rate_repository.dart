import 'package:trip_planner/core/domain/entities/exchange_rate_entity.dart';

abstract class ExchangeRateRepository {
  Future<ExchangeRateEntity> getRates(String baseCurrency);
}
