// domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<bool> sendOtp(String mobile);
  Future<bool> verifyOtp(String code);
}