import '../../domain/entities/gallery_item.dart';
import '../../domain/repositories/gallery_repository.dart';
import '../models/gallery_item_model.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  @override
  Future<List<GalleryItem>> getGalleryItems() async {
    return [
      const GalleryItemModel(assetPath: 'assets/Money-Growth.png'),
      const GalleryItemModel(assetPath: 'assets/Raise-Fund.png'),
      const GalleryItemModel(assetPath: 'assets/Rejected.png'),
      const GalleryItemModel(assetPath: 'assets/Schedule-Plan.png'),
      const GalleryItemModel(assetPath: 'assets/Target.png'),
      const GalleryItemModel(assetPath: 'assets/Teamwork.png'),
    ];
  }
}
