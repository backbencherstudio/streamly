import 'package:streamly/core/services/reset_token_storage.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_storage.dart';
import '../../../../core/utils/api_end_point.dart';

class ResetPasswordRepository {
  final ApiService apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();
  final ResetTokenStorage resetTokenStorage = ResetTokenStorage();

  Future<bool> resetPassword(String password) async {
    final data = {
      'newPassword': password,
    };

    try {
      final response = await apiService.post(ApiEndPoint.reset_password, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        await resetTokenStorage.clearToken();
        return true;
      } else {
        throw Exception('Failed to reset password: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to reset password: $error");
    }

  }
}