import 'package:objectbox/objectbox.dart';

@Entity()
class DestinationDbEntity {
  @Id()
  int id = 0;
  @Unique(onConflict: ConflictStrategy.replace)
  String uniqueId; // This will be the 'cca3' code like 'EGY'

  String name;
  String capital;
  String region;
  int population;
  String flagUrl;
  String currencyCode;
  String currencyName;
  String currencySymbol;
  double lat;
  double lon;
  // Note: We'll store lists as a single JSON-encoded string.
  String languages; // JSON string of List<String>
  String timezones; // JSON string of List<String>
  String imageUrls; // JSON string of List<String>

  DestinationDbEntity({
    this.id = 0,
    required this.uniqueId,
    required this.name,
    required this.capital,
    required this.region,
    required this.population,
    required this.flagUrl,
    required this.currencyCode,
    required this.currencyName,
    required this.currencySymbol,
    required this.lat,
    required this.lon,
    required this.languages,
    required this.timezones,
    required this.imageUrls,
  });
}
