import 'package:dio/dio.dart';
import 'package:trip_planner/features/destination/data/models/destination_dto.dart';

class DestinationRemoteDataSource {
  final Dio _dio;

  DestinationRemoteDataSource(this._dio);

  static const String _baseUrl = 'https://restcountries.com/v3.1/all';

  Future<List<DestinationDto>> fetchDestinations() async {
    try {
      final queryParameters = {
        'fields':
            'name,cca3,capital,region,population,currencies,languages,flags,timezones,latlng',
      };
      final response = await _dio.get(
        _baseUrl,
        queryParameters: queryParameters,
      );

      final json = response.data;

      final data = List<DestinationDto>.from(
        json.map(
          (item) => DestinationDto.fromJson(item as Map<String, dynamic>),
        ),
      );

      return data;
    } catch (e) {
      return [];
    }
  }

  // Inside your DestinationRemoteDataSource class

  Future<DestinationDto> fetchDestinationByCode(String code) async {
    // Add a guard clause to prevent an empty code from making an API call
    if (code.trim().isEmpty) {
      throw Exception('Destination code cannot be empty.');
    }

    try {
      // We add the 'fields' parameter for an optimized, smaller payload,
      // just like our 'getAll' method.
      final response = await _dio.get(
        'https://restcountries.com/v3.1/alpha/$code',
        queryParameters: {
          'fields':
              'name,cca3,capital,region,population,languages,currencies,flags,timezones,latlng',
        },
      );

      // Defensive check: Ensure the response data is a non-empty list.
      if (response.data is List && (response.data as List).isNotEmpty) {
        final jsonData = response.data[0] as Map<String, dynamic>;
        return DestinationDto.fromJson(jsonData);
      } else {
        // This case handles a successful 200 OK but with unexpected empty data.
        throw Exception(
          'API returned an empty or invalid response for code: $code',
        );
      }
    } on DioException catch (e) {
      // Re-throw a specific, informative exception for the repository to handle.
      // A 404 is a common, valid failure case here.
      if (e.response?.statusCode == 404) {
        throw Exception('Destination with code "$code" not found.');
      }
      throw Exception('Failed to fetch destination by code: ${e.message}');
    }
  }
}
