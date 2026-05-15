import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySliderWithIndicator extends StatefulWidget {
  const MySliderWithIndicator({super.key});

  @override
  State<MySliderWithIndicator> createState() => _MySliderWithIndicatorState();
}

class _MySliderWithIndicatorState extends State<MySliderWithIndicator> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> images = [
    'assets/banner/banner3.webp',
    'assets/banner/banner5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          items: images.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? Colors.blueAccent
                      : Colors.grey.withOpacity(0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
