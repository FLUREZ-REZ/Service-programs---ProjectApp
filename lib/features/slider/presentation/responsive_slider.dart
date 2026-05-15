import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'slider_provider.dart';

class ResponsiveSlider extends StatefulWidget {
  const ResponsiveSlider({super.key});

  @override
  State<ResponsiveSlider> createState() => _ResponsiveSliderState();
}

class _ResponsiveSliderState extends State<ResponsiveSlider> {
  int _current = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {

    final sliderProvider = Provider.of<SliderProvider>(context);
    final width = MediaQuery.of(context).size.width;


    if (sliderProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (sliderProvider.error != null) {
      return Center(child: Text(sliderProvider.error!));
    }
    if (sliderProvider.images.isEmpty) {
      return const SizedBox.shrink();
    }


    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CarouselSlider(
            carouselController: _carouselController,
            items: sliderProvider.images.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
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
                },
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
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 10),


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliderProvider.images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // رنگ نقطه فعال پررنگ‌تر و بقیه کم‌رنگ‌تر
                  color: Theme.of(context).primaryColor.withOpacity(
                      _current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
