// presentation/provider/auth_provider.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/usecases/send_otp.dart';
import '../../domain/usecases/verify_otp.dart';

class AuthProvider extends ChangeNotifier {
  final SendOtp sendOtpUseCase;
  final VerifyOtp verifyOtpUseCase;

  bool isLoading = false;

  int _secondsRemaining = 0;
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;
  bool get canResend => _secondsRemaining == 0;

  AuthProvider(this.sendOtpUseCase, this.verifyOtpUseCase);

  Future<bool> sendOtp(String mobile) async {
    isLoading = true;
    notifyListeners();

    final result = await sendOtpUseCase(mobile);

    isLoading = false;
    if (result) startTimer(); // شروع تایمر بعد از ارسال موفق
    notifyListeners();
    return result;
  }

  Future<bool> resendOtp(String mobile) async {
    if (!canResend) return false;
    return await sendOtp(mobile);
  }

  void startTimer() {
    _secondsRemaining = 60; // مدت زمان انتظار
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
    notifyListeners();
  }

  Future<bool> verifyOtp(String code) async {
    isLoading = true;
    notifyListeners();

    final result = await verifyOtpUseCase(code);

    isLoading = false;
    notifyListeners();
    return result;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}