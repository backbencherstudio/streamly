import 'package:flutter/material.dart';
import 'package:streamly/core/utils/api_end_point.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_storage.dart';

class LoginRepository {
  final ApiService apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();

  Future<String?> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await apiService.post(ApiEndPoint.login, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data['token'];
        if (token != null) {
          debugPrint('auth token: $token');
          return token;
        }
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to login: $error");
    }
    return null;
  }
}
