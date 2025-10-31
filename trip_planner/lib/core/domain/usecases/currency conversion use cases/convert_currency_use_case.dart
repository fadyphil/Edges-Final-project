// lib/core/domain/usecases/convert_currency_use_case.dart
import 'package:trip_planner/core/domain/repo/exchange_rate_repository.dart';

class ConvertCurrencyUseCase {
  final ExchangeRateRepository _repository;

  ConvertCurrencyUseCase(this._repository);

  /// Converts an amount from a base currency to a target currency.
  /// Throws an Exception if the target currency rate is not found.
  Future<double> call({
    required String fromCurrency,
    required String toCurrency,
    required double amount,
  }) async {
    // REFINEMENT 2: Make the currency codes case-insensitive for robustness.
    final from = fromCurrency.toUpperCase();
    final to = toCurrency.toUpperCase();

    if (from == to) {
      return amount;
    }

    // REFINEMENT 1: Call the consistent repository method name 'getRates'.
    final exchangeRates = await _repository.getRates(from);

    final rate = exchangeRates.rates[to];

    if (rate == null) {
      // This is a business logic failure, so throwing an error is correct.
      throw Exception(
        'Exchange rate for $to not found for base currency $from.',
      );
    }

    return amount * rate;
  }
}
