import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_point.dart';

class EditPasswordRepository {
  final ApiService apiService = ApiService();

  String _error = '';
  String get error => _error;

  void setError(String error) {
    _error = error;
  }

  Future<bool> editPassword(String newPassword, String confirmPassword) async {

    final data = {
      'newPassword': newPassword == '' ? null : newPassword,
      'currentPassword': confirmPassword == '' ? null : confirmPassword,
    };

    try {
      final response = await apiService.put(ApiEndPoint.updateUserPassword, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        setError(response.data['message']);
        throw Exception(response.data['message']);
      }
    } catch (error) {
      throw Exception("Failed to change password: $error");
    }
  }
}