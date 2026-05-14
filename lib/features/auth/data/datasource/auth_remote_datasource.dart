// data/datasource/auth_remote_datasource.dart
import 'dart:math';
import '../../../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  String? _sentCode;

  AuthRemoteDataSource(this.apiClient);

  String _generateCode() {
    final rnd = Random();
    return (100000 + rnd.nextInt(900000)).toString();
  }

  Future<bool> sendOtp(String mobile) async {
    _sentCode = _generateCode();

    final res = await apiClient.post(
      '/api/sw1/SmsOTP',
      {
        "code": _sentCode,
        "mobile": mobile,
        "template": 1,
      },
    );

    print("STATUS: ${res.statusCode}");
    print("BODY: ${res.body}");

    return res.statusCode == 200;
  }

  Future<bool> verifyOtp(String code) async {
    return code == _sentCode;
  }
}