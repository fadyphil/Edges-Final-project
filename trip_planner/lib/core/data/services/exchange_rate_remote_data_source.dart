import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExchangeRateRemoteDataSource {
  final Dio _dio;

  ExchangeRateRemoteDataSource(this._dio);

  static const String _baseUrl = 'https://v6.exchangerate-api.com/v6/';

  Future<Map<String, dynamic>> fetchExchangeRates(String baseCurrency) async {
    try {
      final apiKey = dotenv.env['EXCHANGERATE_API_KEY'];
      final url = '$_baseUrl$apiKey/latest/$baseCurrency';
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Failed to fetch exchange rates: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch exchange rates: ${e.message}');
    }
  }
}
