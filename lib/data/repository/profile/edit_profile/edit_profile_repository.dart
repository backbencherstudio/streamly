import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_point.dart';

class EditProfileRepository {
  final ApiService apiService = ApiService();

  Future<bool> editProfileData(String email, String name, String contact) async {

    final data = {
      'email': email == '' ? null : email,
      'name': name == '' ? null : name,
      'phone_number': contact == '' ? null : contact,
    };

    try {
      final response = await apiService.put(ApiEndPoint.updateUserProfileData, data: data);

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