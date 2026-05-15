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
        title: 'لذت خرید',
      ),
      GalleryItem(
        imagePath: 'assets/Marketing-Idea.png',
        title: 'قبض برق',
      ),
      GalleryItem(
        imagePath: 'assets/price.png',
        title: 'جوایز شگفت انگیز',
      ),
      GalleryItem(
        imagePath: 'assets/Target.png',
        title: 'راه سرمایه گذاری',
      ),
      GalleryItem(
        imagePath: 'assets/Commissions.png',
        title: 'نیکوکاری',
      ),
      GalleryItem(
        imagePath: 'assets/Schedule-Plan.png',
        title: 'برنامه ریزی',
      ),
      GalleryItem(
        imagePath: 'assets/Solution.png',
        title: 'انواع بیمه',
      ),
      GalleryItem(
        imagePath: 'assets/Teamwork.png',
        title: 'شراکت',
      ),
      GalleryItem(
        imagePath: 'assets/whale.png',
        title: 'سرگرمی',
      ),
      GalleryItem(
        imagePath: 'assets/Market-Prediction.png',
        title: 'بازار ارزی',
      ),
      GalleryItem(
        imagePath: 'assets/Reward.png',
        title: 'قرعه کشی',
      ),
      GalleryItem(
        imagePath: 'assets/Raise-Fund.png',
        title: 'سرمایه گذاری',
      ),


    ];

    _isLoading = false;
    notifyListeners();
  }
}
