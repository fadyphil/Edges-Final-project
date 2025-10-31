import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ImageRemoteDataSource {
  final Dio _dio;

  ImageRemoteDataSource(this._dio);

  Future<List<String>> fetchImgageUrls(String query) async {
    try {
      final apiKey = dotenv.env['UNSPLASH_ACCESS_KEY'];
      final response = await _dio.get(
        'https://api.unsplash.com/search/photos',
        queryParameters: {
          'query': query,
          'per_page': 10, // You can adjust the number of images
        },
        options: Options(headers: {'Authorization': 'Client-ID $apiKey'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results
            .map<String>((item) => item['urls']['regular'] as String)
            .toList();
      } else {
        throw Exception(
          'Failed to load images: ${response.statusCode} ${response.statusMessage}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }
}
