import 'dart:convert';

import 'package:trip_planner/features/destination/data/local/destination_db_entity.dart';
import 'package:trip_planner/features/destination/data/models/destination_dto.dart';
import 'package:trip_planner/features/destination/domain/entities/currency_entity.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';

class DestinationMapper {
  static Destination fromDto(DestinationDto dto) {
    return Destination(
      id: dto.id,
      name: dto.name,
      capital: dto.capital,
      region: dto.region,
      population: dto.population,
      languages: dto.languages,
      currency: Currency(
        name: dto.currencyDetails['name'] as String,
        symbol: dto.currencyDetails['symbol'] as String,
      ),
      flagUrl: dto.flagUrl,
      imageUrls: dto.imageUrls,
      timezone: dto.timezone,
      latitude: dto.latitude,
      longitude: dto.longitude,
      currencyCode: dto.currencyCode,
    );
  }

  static DestinationDto toDto(Destination entity) {
    return DestinationDto(
      id: entity.id,
      name: entity.name,
      capital: entity.capital,
      region: entity.region,
      population: entity.population,
      languages: entity.languages,
      currencyDetails: {
        'name': entity.currency.name,
        'symbol': entity.currency.symbol,
      },
      flagUrl: entity.flagUrl,
      imageUrls: entity.imageUrls,
      timezone: entity.timezone,
      latitude: entity.latitude,
      longitude: entity.longitude,
      currencyCode: entity.currencyCode,
    );
  }

  // --- FROM DB ENTITY (Cache Model) TO DOMAIN ENTITY ---
  static Destination fromDbEntity(DestinationDbEntity dbEntity) {
    return Destination(
      id: dbEntity.uniqueId,
      name: dbEntity.name,
      capital: dbEntity.capital,
      region: dbEntity.region,
      population: dbEntity.population,
      languages: (json.decode(dbEntity.languages) as List).cast<String>(),
      currency: Currency(
        name: dbEntity.currencyName,
        symbol: dbEntity.currencySymbol,
      ),
      flagUrl: dbEntity.flagUrl,
      imageUrls: (json.decode(dbEntity.imageUrls) as List).cast<String>(),
      timezone: (json.decode(dbEntity.timezones) as List).first,
      latitude: dbEntity.lat,
      longitude: dbEntity.lon,
      currencyCode: dbEntity.currencyCode,
    );
  }

  // --- FROM DTO (API Model) TO DB ENTITY (Cache Model) ---
  static DestinationDbEntity toDbEntity(DestinationDto dto) {
    return DestinationDbEntity(
      uniqueId: dto.id,
      name: dto.name,
      capital: dto.capital,
      region: dto.region,
      population: dto.population,
      flagUrl: dto.flagUrl,
      currencyCode: dto.currencyCode,
      currencyName: dto.currencyDetails['name'] as String? ?? 'N/A',
      currencySymbol: dto.currencyDetails['symbol'] as String? ?? 'N/A',
      lat: dto.latitude,
      lon: dto.longitude,
      // Store lists as JSON strings in the database
      languages: json.encode(dto.languages),
      timezones: json.encode([dto.timezone]), // Store as a list for consistency
      imageUrls: json.encode(dto.imageUrls), // Will be an empty list initially
    );
  }
}
