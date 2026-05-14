import '../entities/gallery_item.dart';
import '../repositories/gallery_repository.dart';

class GetGalleryItems {
  final GalleryRepository repository;

  GetGalleryItems(this.repository);

  Future<List<GalleryItem>> call() async {
    return await repository.getGalleryItems();
  }
}
