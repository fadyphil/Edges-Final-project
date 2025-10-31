import 'package:trip_planner/core/domain/repo/image_repository.dart';

class GetImagesForDestinationUseCase {
  final ImageRepository _imageRepository;

  GetImagesForDestinationUseCase(this._imageRepository);

  Future<List<String>> call(String destinationName) async {
    return await _imageRepository.getImageUrlsForDestination(destinationName);
  }
}
