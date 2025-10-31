import 'package:objectbox/objectbox.dart';
import 'package:trip_planner/core/data/local/trips/trip_db_entity.dart';

@Entity()
class ExpenseDbEntity {
  @Id()
  int id = 0;

  String category;
  double amount;
  String currencyCode;

  @Property(type: PropertyType.date)
  DateTime date;
  String description;

  final trip = ToOne<TripDbEntity>();

  ExpenseDbEntity({
    this.id = 0,
    required this.category,
    required this.amount,
    required this.currencyCode,
    required this.date,
    required this.description,
  });
}
