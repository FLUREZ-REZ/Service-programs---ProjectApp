import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';
import 'home_page.dart';

class OtpPageWithMobile extends StatefulWidget {
  final String mobile;

  const OtpPageWithMobile(this.mobile, {super.key});

  @override
  State<OtpPageWithMobile> createState() => _OtpPageWithMobileState();
}

class _OtpPageWithMobileState extends State<OtpPageWithMobile> {
  final List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(6, (_) => FocusNode());

  String get enteredCode => controllers.map((e) => e.text).join();

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    final size = MediaQuery.of(context).size;

    final isSmallScreen = size.width < 360;
    final isTablet = size.width > 600;

    final otpBoxSize = isSmallScreen
        ? size.width * 0.11
        : isTablet
        ? 60.0
        : size.width * 0.13;

    final otpBoxHeight = isTablet ? 70.0 : size.height * 0.07;

    final contentWidth = isTablet ? 500.0 : size.width * 0.92;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "ورود با رمز پیامکی",
            style: TextStyle(
              fontFamily: 'iran',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.black,
                    thickness: 3,
                    height: 3,
                  ),
                  SizedBox(height: size.height * 0.06),

                  SizedBox(
                    width: contentWidth,
                    child: Text(
                      "کد 6 رقمی پیامک شده به شماره زیر را وارد نمایید",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'iran',
                        fontSize: isSmallScreen ? 11 : 13,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.015),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.mobile,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isSmallScreen ? 11 : 13,
                          fontFamily: 'iran',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.edit_off_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.03),

                  SizedBox(
                    width: contentWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: otpBoxSize,
                          height: otpBoxHeight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54,
                            ),
                            child: TextField(
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(color: Colors.white),
                              controller: controllers[index],
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                counterText: "",
                                border: InputBorder.none,
                              ),
                              onChanged: (value) => _onChanged(index, value),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  SizedBox(
                    width: isTablet ? 220 : size.width * 0.7,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: provider.isLoading
                          ? null
                          : () async {
                        final code = enteredCode;
                        if (code.length == 6) {
                          final ok = await provider.verifyOtp(code);
                          if (ok && context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Homepage(),
                              ),
                                  (_) => false,
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: provider.isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                          : const Text(
                        "تایید",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'iran',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  provider.canResend
                      ? TextButton(
                    onPressed: () async {
                      await provider.resendOtp(widget.mobile);
                    },
                    child: const Text(
                      "ارسال مجدد کد",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'iran',
                        fontSize: 12,
                      ),
                    ),
                  )
                      : Text(
                    "ارسال مجدد تا ${provider.secondsRemaining} ثانیه دیگر",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
