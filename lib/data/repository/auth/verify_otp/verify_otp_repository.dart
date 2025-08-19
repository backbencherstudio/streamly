import 'package:streamly/core/services/reset_token_storage.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_storage.dart';
import '../../../../core/utils/api_end_point.dart';

class VerifyOtpRepository {
  final ApiService apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();
  final ResetTokenStorage resetTokenStorage = ResetTokenStorage();

  Future<bool> verifyOtp(String email, String otp) async {
    final data = {
      'email': email,
      "otp": otp,
    };

    try {
      final response = await apiService.post(ApiEndPoint.verify_otp, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        await resetTokenStorage.clearToken();
        await tokenStorage.clearToken();
        await resetTokenStorage.saveToken(response.data['token']);
        return true;
      } else {
        throw Exception('Failed to forget password: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Failed to forget password: $error");
    }
  }
}