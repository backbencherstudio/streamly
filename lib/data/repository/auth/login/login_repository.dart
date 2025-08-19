import 'package:flutter/material.dart';
import 'package:streamly/core/services/token_storage.dart';
import 'package:streamly/core/utils/api_end_point.dart';

import '../../../../core/services/api_services.dart';

class LoginRepository {
  final ApiService apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();

  Future<bool> login(String email, String password) async {

    final data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await apiService.post(ApiEndPoint.login, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data['token'];
        await tokenStorage.saveToken(token);
        debugPrint('auth token: $token');
        return true;
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to login: $error");
    }
  }
}
