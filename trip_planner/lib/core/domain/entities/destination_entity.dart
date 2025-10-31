import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/domain/entities/currency_entity.dart';

part 'destination_entity.freezed.dart';

@freezed
abstract class Destination with _$Destination{

  const factory Destination({
    required String id,
    required String name,
    required String capital,
    required String region,
    required int population,
    required List<String> languages,
    required Currency currency,
    required String flagUrl,
    required List<String> imageUrls,
    required String timezone,
    required double latitude,
    required double longitude,
    required String currencyCode,
  }) = _Destination;
}

