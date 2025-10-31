// lib/core/data/local/favorite_db_entity.dart
import 'package:objectbox/objectbox.dart';

@Entity()
class FavoriteDbEntity {
  @Id()
  int id = 0; // The ObjectBox ID (must be non-final and mutable)

  // This is the important part: the unique ID of the Destination
  final String destinationId;

  FavoriteDbEntity({this.id = 0, required this.destinationId});
}
