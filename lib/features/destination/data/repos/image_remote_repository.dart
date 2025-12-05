import 'dart:developer';

import 'package:trip_planner/features/destination/data/remote/image_remote_data_source.dart';
import 'package:trip_planner/features/destination/domain/repos/image_repository.dart';

class ImageRemoteRepository implements ImageRepository {
  final ImageRemoteDataSource apiService;
  ImageRemoteRepository(this.apiService);

  @override
  Future<List<String>> getImageUrlsForDestination(
    String destinationName,
  ) async {
    try {
      final query = '$destinationName travel';
      final data = await apiService.fetchImgageUrls(query);
      return data;
    } catch (e) {
      log(
        '❌ ERROR in ImageRepositoryImpl: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return [];
    }
  }
}
