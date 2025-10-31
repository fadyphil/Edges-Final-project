import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_entity.freezed.dart';

@freezed
abstract class Budget with _$Budget {
  const factory Budget({
    required double amount,
    required String currency,
  }) = _Budget;
}