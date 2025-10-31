import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_entity.freezed.dart';

@freezed
abstract class Currency with _$Currency{
  const factory Currency({
    required String name,
    required String symbol,
  }) = _Currency;


}