import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'slider_provider.dart';

class ResponsiveSlider extends StatelessWidget {
  const ResponsiveSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context);
    final width = MediaQuery.of(context).size.width;

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(child: Text(provider.error!));
    }

    if (provider.images.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider(
        items: provider.images.map((imagePath) {
          return SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: width * 0.45,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}
