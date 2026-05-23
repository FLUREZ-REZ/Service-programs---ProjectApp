import 'package:flutter/material.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page1.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page2.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page3.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page4.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page5.dart';
import 'package:weatherapp/features/slider/presentation/horizontal-pages/page6.dart';


class CircularImageSlider extends StatelessWidget {
  CircularImageSlider({super.key});

  final List<Map<String, dynamic>> items = [
    {'image': 'assets/digipay.png', 'title': 'دیجی پی'},
    {'image': 'assets/meligold.png', 'title': 'ملی گلد'},
    {'image': 'assets/otagh.png', 'title': 'اتاقک'},
    {'image': 'assets/meliligold.webp', 'title': 'میلی گلد'},
    {'image': 'assets/snappfood.jpg', 'title': 'اسنپ فود'},
    {'image': 'assets/4dot.png', 'title': 'مشاهده بیشتر'},
  ];

  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const Page6(),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          return Column(
            children: [

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => pages[index]),
                  );
                },
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(items[index]['image']),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 72,
                child: Text(
                  items[index]['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 10 , fontFamily: 'iran'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
