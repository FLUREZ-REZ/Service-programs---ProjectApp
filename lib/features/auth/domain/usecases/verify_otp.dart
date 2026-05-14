// domain/usecases/verify_otp.dart
import '../repositories/auth_repository.dart';

class VerifyOtp {
  final AuthRepository repo;
  VerifyOtp(this.repo);

  Future<bool> call(String code) => repo.verifyOtp(code);
}