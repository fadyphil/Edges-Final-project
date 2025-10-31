import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_entity.freezed.dart';

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
  }) = _Expense;
}
