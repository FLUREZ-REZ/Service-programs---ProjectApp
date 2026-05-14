// domain/usecases/send_otp.dart
import '../repositories/auth_repository.dart';

class SendOtp {
  final AuthRepository repo;
  SendOtp(this.repo);

  Future<bool> call(String mobile) => repo.sendOtp(mobile);
}