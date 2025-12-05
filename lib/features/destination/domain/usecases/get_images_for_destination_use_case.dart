import 'package:trip_planner/features/destination/domain/repos/image_repository.dart';

class GetImagesForDestinationUseCase {
  final ImageRepository _imageRepository;

  GetImagesForDestinationUseCase(this._imageRepository);

  Future<List<String>> call(String destinationName) async {
    return await _imageRepository.getImageUrlsForDestination(destinationName);
  }
}
