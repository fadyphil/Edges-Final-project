import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/domain/usecases/get_images_for_destination_use_case.dart';

class DestinationImageUrlsCubit extends Cubit<ApiState<List<String>>> {
  final GetImagesForDestinationUseCase _getImagesForDestinationUseCase;

  DestinationImageUrlsCubit(this._getImagesForDestinationUseCase)
    : super(const ApiState.initial());

  Future<void> fetchImageUrls(String destinationName) async {
    emit(const ApiState.loading());
    try {
      final imageUrls = await _getImagesForDestinationUseCase(destinationName);
      emit(ApiState.success(data: imageUrls));
    } catch (e) {
      log(
        '❌ ERROR in DestinationImageUrlsCubit: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      emit(ApiState.error(message: 'Failed to fetch image URLs'));
    }
  }
}
