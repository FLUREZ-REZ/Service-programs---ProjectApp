// core/network/api_client.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final String token;

  ApiClient({required this.baseUrl, required this.token});

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );
  }
}