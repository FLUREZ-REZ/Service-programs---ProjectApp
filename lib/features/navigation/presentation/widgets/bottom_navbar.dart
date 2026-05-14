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
      {'icon': 'assets/bill5.png', 'label': 'قبض ها'},
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(25, 30, 40, 1),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () {
                provider.changeIndex(index);

                // تغییر صفحه با Navigator
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
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[index]['label']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white54,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 10,
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
