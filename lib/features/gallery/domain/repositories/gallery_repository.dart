import '../entities/gallery_item.dart';

abstract class GalleryRepository {
  Future<List<GalleryItem>> getGalleryItems();
}

