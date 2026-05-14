import 'package:flutter/material.dart';

class GalleryItem {
  final String imagePath;
  final String title;

  GalleryItem({
    required this.imagePath,
    required this.title,
  });
}

class GalleryProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<GalleryItem> _items = [];

  bool get isLoading => _isLoading;
  List<GalleryItem> get items => _items;

  Future<void> loadGallery() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));

    _items = [
      GalleryItem(
        imagePath: 'assets/Teamwork.png',
        title: 'طلوع آفتاب',
      ),
      GalleryItem(
        imagePath: 'assets/Target.png',
        title: 'هوای ابری',
      ),
      GalleryItem(
        imagePath: 'assets/Schedule-Plan.png',
        title: 'باران ملایم',
      ),
      GalleryItem(
        imagePath: 'assets/Rejected.png',
        title: 'غروب زیبا',
      ),
      GalleryItem(
        imagePath: 'assets/Raise-Fund.png',
        title: 'شب آرام',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
      GalleryItem(
        imagePath: 'assets/Money-Growth.png',
        title: 'هوای پاک',
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
