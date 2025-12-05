import 'package:objectbox/objectbox.dart';
import 'package:trip_planner/features/trip/data/local/expense_db_entity.dart';

@Entity()
class TripDbEntity {
  @Id()
  int id = 0;

  String name;
  String destinationId;
  @Property(type: PropertyType.date)
  DateTime startDate;
  @Property(type: PropertyType.date)
  DateTime endDate;
  double budget;
  String budgetCurrencyCode;
  bool isCompleted = false;
  String? notes;

  final expenses = ToMany<ExpenseDbEntity>();

  TripDbEntity({
    this.id = 0,
    required this.name,
    required this.destinationId,
    required this.startDate,
    required this.endDate,
    required this.budget,
    required this.budgetCurrencyCode,
    this.notes,
    this.isCompleted = false,
  });
}
