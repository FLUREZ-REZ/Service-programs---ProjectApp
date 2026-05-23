import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/navigation/presentation/pages/add_page.dart';
import 'package:weatherapp/features/navigation/presentation/pages/gallery_page.dart';
import 'package:weatherapp/features/navigation/presentation/pages/messages_page.dart';
import 'package:weatherapp/features/navigation/presentation/pages/profile_page.dart';
import 'package:weatherapp/features/navigation/presentation/providers/navigation_provider.dart';



class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final currentIndex = provider.currentIndex;

    final items = [
      {'icon': 'assets/credit-card2.png', 'label': 'کارت به کارت'},
      {'icon': 'assets/mycar.png', 'label': 'خدمات خودرو'},
      {'icon': 'assets/credit-card.png', 'label': 'خرید شارژ'},

    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15 , left: 30 , right: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(24),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () {
                provider.changeIndex(index);


                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GalleryPage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AddPage()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MessagesPage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProfilePage()),
                    );
                    break;
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    items[index]['icon']!,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[index]['label']!,
                    style: TextStyle(
                      fontFamily: 'iran' ,
                      fontSize: 10 ,

                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
