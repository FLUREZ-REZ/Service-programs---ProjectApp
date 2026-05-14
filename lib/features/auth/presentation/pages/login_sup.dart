import 'package:flutter/material.dart';
import 'package:weatherapp/features/auth/presentation/pages/login_page.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    // گرفتن اندازه صفحه برای ریسپانسیو
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "سوالات متداول",
              style: TextStyle(
                fontFamily: 'iran',
                color: Colors.white,
                fontSize: width * 0.04, // فونت متناسب با عرض صفحه
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.3), // فاصله نسبی
                    Text(
                      "بزودی در دسترس قرار می‌گیرد",
                      style: TextStyle(
                        fontFamily: 'iran',
                        fontSize: width * 0.045, // فونت نسبی
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.02),
                    SizedBox(
                      width: width * 0.5,
                      height: height * 0.06,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            const Color.fromRGBO(25, 30, 40, 1),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.02),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  LoginPage()));
                        },
                        child: Text(
                          "بازگشت",
                          style: TextStyle(
                            fontFamily: 'iran',
                            color: Colors.white,
                            fontSize: width * 0.04,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
