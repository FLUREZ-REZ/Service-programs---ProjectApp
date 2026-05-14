import '../../domain/entities/gallery_item.dart';

class GalleryItemModel extends GalleryItem {
  const GalleryItemModel({
    required super.assetPath,
  });

  factory GalleryItemModel.fromAsset(String path) {
    return GalleryItemModel(assetPath: path);
  }
}
