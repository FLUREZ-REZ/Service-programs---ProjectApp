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
        imagePath: 'assets/bag3.png',
        title: 'طلوع آفتاب',
      ),
      GalleryItem(
        imagePath: 'assets/Marketing-Idea.png',
        title: 'هوای ابری',
      ),
      GalleryItem(
        imagePath: 'assets/price.png',
        title: 'جوایز شگفت انگیز',
      ),
      GalleryItem(
        imagePath: 'assets/Target.png',
        title: 'غروب زیبا',
      ),
      GalleryItem(
        imagePath: 'assets/Commissions.png',
        title: 'غروب زیبا',
      ),
      GalleryItem(
        imagePath: 'assets/Schedule-Plan.png',
        title: 'غروب زیبا',
      ),
      GalleryItem(
        imagePath: 'assets/Solution.png',
        title: 'غروب زیبا',
      ),
      GalleryItem(
        imagePath: 'assets/Teamwork.png',
        title: 'غروب زیبا',
      ),


    ];

    _isLoading = false;
    notifyListeners();
  }
}
