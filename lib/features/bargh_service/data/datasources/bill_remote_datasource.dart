import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/features/bargh_service/data/models/power_bill_response.dart';

abstract class BillRemoteDatasource {
  Future<PowerBillResponse> fetchPowerBillInfo(String billID);
}

class BillRemoteDatasourceImpl implements BillRemoteDatasource {
  final String baseUrl;
  final String token;

  BillRemoteDatasourceImpl({
    required this.baseUrl,
    required this.token,
  });

  @override
  Future<PowerBillResponse> fetchPowerBillInfo(String billID) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final body = jsonEncode({"billID": billID});

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: body,
    );

    // اگر statusCode غیر 200 شد، خطا می‌گیریم
    if (response.statusCode != 200) {
      throw Exception('HTTP Error: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return PowerBillResponse.fromJson(decoded);
  }
}
