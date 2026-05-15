import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/slider/presentation/images-slider-horizontal.dart';
import 'package:weatherapp/features/slider/presentation/my_slider.dart';


import 'package:weatherapp/features/slider/presentation/responsive_slider.dart';
import 'package:weatherapp/features/slider/data/slider_data_source.dart';
import 'package:weatherapp/features/slider/domain/slider_repository.dart';
import 'package:weatherapp/features/slider/presentation/slider_provider.dart';

import 'package:weatherapp/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:weatherapp/features/gallery/presentation/widgets/gallery_provider.dart';


import 'package:weatherapp/features/navigation/presentation/widgets/bottom_navbar.dart'; // مسیر این فایل را چک کنید
import 'package:weatherapp/features/navigation/presentation/providers/navigation_provider.dart'; // مسیر این فایل را چک کنید

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) {
            final dataSource = SliderDataSource();
            final repository = SliderRepository(dataSource);
            final provider = SliderProvider(repository);
            provider.loadImages();
            return provider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            final provider = GalleryProvider();
            provider.loadGallery();
            return provider;
          },
        ),

        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
            centerTitle: true,
            title: Image.asset(
              'assets/blacksplash.png',
              height: 64,
              fit: BoxFit.contain,
            ),
          ),
          body: Stack(
            children: [

              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(25, 30, 40, 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/nicewallet.png',
                                  width: 24,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "کیف پول",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'iran',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width * 0.05,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: ResponsiveSlider(),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: GalleryGrid(),
                    ),
                    const SizedBox(height: 10),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text("فروشگاه ها" , style: TextStyle(color: Colors.white , fontFamily: 'iran'),),
                      ),
                    ),
                    SizedBox(height: 15,),
                    
                    CircularImageSlider(),

                    MySliderWithIndicator(),
                    SizedBox(height:   MediaQuery.of(context).size.height* 0.15,),


                  ],
                ),
              ),


              const BottomNavbar(),



            ],
          ),
        ),
      ),
    );
  }
}
