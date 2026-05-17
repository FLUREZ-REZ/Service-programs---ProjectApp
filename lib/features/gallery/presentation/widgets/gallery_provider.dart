import 'package:flutter/material.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Commissions.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Funds.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Market-Prediction.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Marketing-Idea.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Raise-Fund.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Reward.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Schedule-Plan.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Solution.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Target.dart';
import 'package:weatherapp/features/gallery/presentation/pages/Teamwork.dart';
import 'package:weatherapp/features/gallery/presentation/pages/bag3.dart';
import 'package:weatherapp/features/gallery/presentation/pages/credit-card.dart';
import 'package:weatherapp/features/gallery/presentation/pages/more2.dart';
import 'package:weatherapp/features/gallery/presentation/pages/price.dart';
import 'package:weatherapp/features/gallery/presentation/pages/soldier3.dart';
import 'package:weatherapp/features/gallery/presentation/pages/whale.dart';

class GalleryItem {
  final String imagePath;
  final String title;
  final Widget page;

  GalleryItem({
    required this.imagePath,
    required this.title,
    required this.page
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
        imagePath: 'assets/Marketing-Idea.png',
        title: 'قبض برق',
        page: const MarketingIdea(),
      ),
      GalleryItem(
        imagePath: 'assets/credit-card.png',
        title: 'خرید شارژ',
        page: const creditCard(),
      ),
      GalleryItem(
        imagePath: 'assets/bag3.png',
        title: 'لذت خرید',
        page: const bag3(),
      ),
      GalleryItem(
        imagePath: 'assets/soldier3.png',
        title: 'خدمات سربازی',
        page: const soldier3(),
      ),
      GalleryItem(
        imagePath: 'assets/Funds.png',
        title: 'قبض آب',
        page: const Funds(),
      ),
      GalleryItem(
        imagePath: 'assets/price.png',
        title: 'جوایز شگفت انگیز',
        page: const price(),
      ),
      GalleryItem(
        imagePath: 'assets/Target.png',
        title: 'راه سرمایه گذاری',
        page: const Target(),
      ),
      GalleryItem(
        imagePath: 'assets/Commissions.png',
        title: 'نیکوکاری',
        page: const Commissions(),
      ),
      GalleryItem(
        imagePath: 'assets/Schedule-Plan.png',
        title: 'برنامه ریزی',
        page: const Scheduleplan(),
      ),
      GalleryItem(
        imagePath: 'assets/Solution.png',
        title: 'انواع بیمه',
        page: const Solution(),
      ),
      GalleryItem(
        imagePath: 'assets/Teamwork.png',
        title: 'شراکت',
        page: const Teamwork(),
      ),
      GalleryItem(
        imagePath: 'assets/whale.png',
        title: 'سرگرمی',
        page: const whale(),
      ),

      GalleryItem(
        imagePath: 'assets/Market-Prediction.png',
        title: 'بازار ارزی',
        page: const MarketPrediction(),
      ),
      GalleryItem(
        imagePath: 'assets/Reward.png',
        title: 'قرعه کشی',
        page: const Reward(),
      ),
      GalleryItem(
        imagePath: 'assets/Raise-Fund.png',
        title: 'سرمایه گذاری',
        page: const Raisefund(),
      ),
      GalleryItem(
        imagePath: 'assets/more2.png',
        title: 'همه خدمات',
        page: const more2(),
      ),


    ];

    _isLoading = false;
    notifyListeners();
  }
}
