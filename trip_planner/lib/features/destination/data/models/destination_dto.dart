class DestinationDto {
  final String id;
  final String name;
  final String capital;
  final String region;
  final int population;
  final List<String> languages;
  final Map<String, dynamic> currencyDetails; // Stored as a map in DTO
  final String flagUrl;
  final List<String> imageUrls;
  final String timezone;
  final double latitude;
  final double longitude;
  final String currencyCode;

  DestinationDto({
    required this.id,
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.languages,
    required this.currencyDetails,
    required this.flagUrl,
    required this.imageUrls,
    required this.timezone,
    required this.latitude,
    required this.longitude,
    required this.currencyCode,
  });

  // Place this inside your DestinationDto class

  factory DestinationDto.fromJson(Map<String, dynamic> json) {
    // Helper to safely get the first element of a list or a default value
    T? getFirst<T>(dynamic list) {
      if (list is List && list.isNotEmpty) {
        return list.first as T?;
      }
      return null;
    }

    // Safely get the currency map
    Map<String, dynamic> getCurrency(dynamic currencies) {
      if (currencies is Map && currencies.isNotEmpty) {
        // Return the first currency object's map
        return currencies.values.first as Map<String, dynamic>;
      }
      // Return a default structure if no currency is found
      return {'name': 'N/A', 'symbol': 'N/A'};
    }

    String getCurrencyCode(dynamic currencies) {
      if (currencies is Map && currencies.isNotEmpty) {
        return currencies.entries.first.key;
      }
      return 'N/A';
    }

    // Safely get the list of languages from the map
    List<String> getLanguages(dynamic languages) {
      if (languages is Map) {
        return languages.values.map((lang) => lang as String).toList();
      }
      return [];
    }

    return DestinationDto(
      // SOLUTION for 'id': Use 'cca3' for a unique ID, provide a fallback.
      id: json['cca3'] ?? 'Unknown ID',

      // SOLUTION for 'name': Access the nested 'common' property.
      name: json['name']['common'] ?? 'Unknown Name',

      // SOLUTION for 'capital': Safely get the first element from the list.
      capital: getFirst<String>(json['capital']) ?? 'N/A',

      // SOLUTION for 'region': Defensively check for null.
      region: json['region'] ?? 'Unknown Region',

      // SOLUTION for 'population': Defensively check for null.
      population: json['population'] ?? 0,

      // SOLUTION for 'languages': Use the helper to extract values from the map.
      languages: getLanguages(json['languages']),

      // SOLUTION for 'currency': Use 'currencies' (plural) and the helper.
      currencyDetails: getCurrency(json['currencies']),

      // SOLUTION for 'flagUrl': Access the nested 'png' URL.
      flagUrl: json['flags']?['png'] ?? '',

      // SOLUTION for 'imageUrls': This data isn't here, so we return an empty list.
      imageUrls: [], // This will be populated from another API source.
      // SOLUTION for 'timezone': Use 'timezones' (plural) and get the first element.
      timezone: getFirst<String>(json['timezones']) ?? 'N/A',
      latitude: json['latlng']?[0] ?? 0.0,
      longitude: json['latlng']?[1] ?? 0.0,
      currencyCode: getCurrencyCode(json['currencies']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'capital': capital,
      'region': region,
      'population': population,
      'languages': languages,
      'currency': currencyDetails,
      'flagUrl': flagUrl,
      'imageUrls': imageUrls,
      'timezone': timezone,
      'latitude': latitude,
      'longitude': longitude,
      'currencyCode': currencyCode,
    };
  }
}
