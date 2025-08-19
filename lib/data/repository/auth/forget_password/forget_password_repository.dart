import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_storage.dart';
import '../../../../core/utils/api_end_point.dart';

class ForgetPasswordRepository {
  final ApiService apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();

  Future<bool> forgetPassword(String email) async {
    final data = {
      'email': email,
    };

    try {
      final response = await apiService.post(ApiEndPoint.forget_password, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to login: $error");
    }
  }
}