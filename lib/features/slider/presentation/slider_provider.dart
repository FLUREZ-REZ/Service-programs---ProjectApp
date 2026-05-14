import 'package:flutter/material.dart';
import '../domain/slider_repository.dart';

class SliderProvider extends ChangeNotifier {
  final SliderRepository repository;

  SliderProvider(this.repository);

  List<String> _images = [];
  List<String> get images => _images;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  void loadImages() {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _images = repository.getImages();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
