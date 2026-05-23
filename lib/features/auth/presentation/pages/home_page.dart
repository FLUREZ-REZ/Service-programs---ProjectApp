import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/di/injection_theme.dart';
import 'package:weatherapp/core/theme_manager.dart';
import 'package:weatherapp/features/slider/presentation/images-slider-horizontal.dart';
import 'package:weatherapp/features/slider/presentation/my_slider.dart';

import 'package:weatherapp/features/slider/presentation/responsive_slider.dart';
import 'package:weatherapp/features/slider/data/slider_data_source.dart';
import 'package:weatherapp/features/slider/domain/slider_repository.dart';
import 'package:weatherapp/features/slider/presentation/slider_provider.dart';

import 'package:weatherapp/features/gallery/presentation/widgets/gallery_grid.dart';
import 'package:weatherapp/features/gallery/presentation/widgets/gallery_provider.dart';

import 'package:weatherapp/features/navigation/presentation/widgets/bottom_navbar.dart'; // مسیر این فایل را چک کنید
import 'package:weatherapp/features/navigation/presentation/providers/navigation_provider.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override

  Widget build(BuildContext context) {



    double screenWidth = MediaQuery.of(context).size.width;

    final double headerHorizontalPadding = screenWidth * 0.05;
    final double usernameFontSize = screenWidth > 600 ? 18 : 16;
    double itemFonts = screenWidth > 600 ? 14 : 12;
    double fontSize = screenWidth > 600 ? 14 : 12;


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
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.menu,),

              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.qr_code_scanner_rounded,),
                onPressed: () {},
              ),
              IconButton(
                icon:  Icon(Icons.search ,
                ),
                onPressed: (){},
              ),
            ],
            centerTitle: true,
            title: Image.asset(
              'assets/blacksplash.png',
              height: 64,
              fit: BoxFit.contain,
            ),
          ),

          drawer: Drawer(

            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 16),
                  color: const Color.fromRGBO(25, 40, 50, 1),
                  child: Row(
                    children: [

                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Color.fromRGBO(25, 30, 40, 1),
                        child: Image.asset("assets/Abilities.png")
                      ),
                      const SizedBox(width: 12),
                      Column(
                        
                        children: [
                          Text(
                            'رضا برادران',
                            style: TextStyle(
                              fontFamily: 'iran',
                              color: Colors.white,
                              fontSize: usernameFontSize,

                            ),
                          ),

                          const SizedBox(height: 4),
                          const Text(
                            '09909378970',
                            style: TextStyle(
                              fontFamily: 'iran',
                              color: Colors.white70,
                              fontSize: 9,
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                ),

                const SizedBox(height: 20),


                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ListTile(
                        leading: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.square_list)),
                        title: Text('تراکنش ها', style: TextStyle( fontFamily: 'iran' , fontSize: itemFonts)),
                      ),
                      ListTile(
                        leading: IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
                        title: Text('تنظیمات', style: TextStyle( fontFamily: 'iran' , fontSize: itemFonts)),
                      ),
                      ListTile(
                        leading: IconButton(
                          icon:  Icon(sl<ThemeManager>().themeMode == ThemeMode.dark
                              ? Icons.light_mode
                              : Icons.dark_mode
                          ),
                          onPressed: ()=> sl<ThemeManager>().toggleTheme(),
                        ),
                        title: Text('روشنایی', style: TextStyle( fontFamily: 'iran' , fontSize: itemFonts)),

                      ),
                      ListTile(
                        leading: IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
                        title: Text('اعلانات', style: TextStyle( fontFamily: 'iran' , fontSize: itemFonts)),
                      ),
                      ListTile(
                        leading: IconButton(onPressed: (){}, icon: Icon(Icons.contact_support_outlined)),
                        title: Text('راهنما', style: TextStyle(fontFamily: 'iran' , fontSize: itemFonts)),

                      ),

                    ],
                  ),
                ),
                Container(
                  height: 40,
                  color: Color.fromRGBO(20, 35, 45, 1),
                  padding: EdgeInsets.symmetric(horizontal: headerHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ورژن" , style: TextStyle(color: Colors.white60 , fontFamily: 'iran' , fontSize: fontSize),),
                      Text("1.1.1.1" , style: TextStyle(color: Colors.white60 , fontFamily: 'iran' , fontSize: fontSize),)
                    ],
                  ),
                )
              ],
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
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(12),

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
                        child: Text(
                          "فروشگاه ها",
                          style: TextStyle( fontFamily: 'iran'),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    CircularImageSlider(),
                    MySliderWithIndicator(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
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
