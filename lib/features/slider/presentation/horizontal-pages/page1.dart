import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:weatherapp/features/auth/presentation/pages/home_page.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
                child: Marquee(
                  text: "در دسترس بزودی",
                  style: TextStyle(

                      fontSize: screenWidth * 0.04,
                      fontFamily: 'iran'
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 30.0,
                  textDirection: TextDirection.ltr,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.easeIn,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: const Text(
                    "بازگشت",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'iran'
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
