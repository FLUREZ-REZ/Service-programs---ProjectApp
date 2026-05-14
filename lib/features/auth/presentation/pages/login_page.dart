import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/features/auth/presentation/pages/login_sup.dart';
import '../provider/auth_provider.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  bool isPhoneValid = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final isSmallScreen = height < 700;

    void checkPhoneLength(String value) {
      setState(() {
        isPhoneValid = value.length == 11;
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
      appBar: AppBar(
        
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Support()));
        }, icon: Icon(Icons.contact_support_outlined , color: Colors.white,)),
        backgroundColor: const Color.fromRGBO(25, 30, 40, 1),
        centerTitle: true,
        title: Text(
          "ورود / ثبت نام",
          style: TextStyle(
            fontFamily: 'iran',
            fontSize: width * 0.032,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(
                    thickness: 3,
                    color: Colors.black,
                    height: 3,
                  ),

                  SizedBox(height: height * 0.06),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "لطفا شماره همراه خود را وارد کنید",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.04,
                            fontFamily: 'iran',
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "برای حفظ امنیت بیشتر و اطمینان از هویت شما",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: width * 0.028,
                            fontFamily: 'iran',
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  SizedBox(
                    width: width * 0.75,
                    child: TextField(
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.white),
                      textDirection: TextDirection.rtl,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: checkPhoneLength,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontFamily: 'iran',
                          fontSize: width * 0.03,
                        ),
                        filled: true,
                        fillColor: Colors.black54,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(width * 0.04),
                          ),
                        ),
                        hintText: "شماره همراه",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(width * 0.04),
                          ),
                          borderSide: const BorderSide(width: 0),
                        ),
                        suffixIcon: const Icon(
                          Icons.phone_android,
                          color: Colors.white60,
                          size: 22,
                        ),
                        prefixIcon: isPhoneValid
                            ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 22,
                        )
                            : null,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),



                  const Spacer(),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      "تایید و ورود شما به معنای پذیرش قوانین فعالیت و ضوابط حریم خصوصی است",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: width * 0.025,
                        fontFamily: 'iran',
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02,),

                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.02,
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: isSmallScreen ? height * 0.06 : height * 0.065,
                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                          if (!isPhoneValid) return;

                          final ok = await provider.sendOtp(
                            phoneController.text,
                          );

                          if (ok) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OtpPageWithMobile(
                                  phoneController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.04),
                          ),
                        ),
                        child: provider.isLoading
                            ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          "تایید",
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontFamily: 'iran',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
