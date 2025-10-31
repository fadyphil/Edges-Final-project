import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _Initial;
  const factory ApiState.loading() = _Loading;
  const factory ApiState.success({required T data}) = _Success;
  const factory ApiState.error({required String message}) = _Error;
}
