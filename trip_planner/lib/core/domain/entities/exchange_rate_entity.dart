class ExchangeRateEntity{
  final String baseCurrency;
  final Map<String, double> rates;

  ExchangeRateEntity({
    required this.baseCurrency,
    required this.rates,
  });
}
