import 'package:flutter/material.dart';
import 'package:weatherapp/features/auth/presentation/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // تنظیم کنترلر انیمیشن
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // مدت زمان چرخش انیمیشن
    );

    // تعریف انیمیشن از 0 تا 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    // شروع انیمیشن
    _controller.forward();

    // شروع تایمر برای رفتن به صفحه بعد
    _navigateToLogin();
  }

  _navigateToLogin() async {
    // صبر کن تا انیمیشن تموم بشه (2 ثانیه)
    await Future.delayed(const Duration(seconds: 4));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // پاکسازی کنترلر برای جلوگیری از نشت حافظه
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset('assets/blacksplash.png'),
            ),
            const SizedBox(height: 20),

            // استفاده از AnimatedBuilder برای به‌روزرسانی خودکار ویجت
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CircularProgressIndicator(
                  value: _animation.value, // مقدار انیمیشن رو اینجا ست می‌کنیم
                  strokeWidth: 4, // ضخامت خط
                  backgroundColor: Colors.grey.shade300, // رنگ پس‌زمینه
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black), // رنگ نوار
                );
              },
            ),

            const SizedBox(height: 10),
            const Text(
              'experimental',
              style: TextStyle(
                color: Colors.black38,
                fontFamily: 'iran',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
