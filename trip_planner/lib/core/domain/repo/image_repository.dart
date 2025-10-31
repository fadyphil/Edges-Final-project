abstract class ImageRepository {
  Future<List<String>> getImageUrlsForDestination(String destinationName);
}
