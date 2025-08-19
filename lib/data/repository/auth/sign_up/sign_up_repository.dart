import 'package:streamly/core/utils/api_end_point.dart';

import '../../../../core/services/api_services.dart';

class SignUpRepository {
  final ApiService apiService = ApiService();

  Future<bool> signUp(String email, String name, String password) async {

    final data = {
      'email': email,
      'name': name,
      'password': password,
    };

    try {
      final response = await apiService.post(ApiEndPoint.register, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to sign up: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to sign up: $error");
    }
  }
}
