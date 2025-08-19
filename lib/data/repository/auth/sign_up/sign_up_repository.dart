import '../../../../core/services/api_services.dart';

class SignUpRepository {
  final ApiService apiService;

  SignUpRepository({required this.apiService});

  Future<bool> signUp(String email, String name, String password) async {
    try {
      // Call the API to register the user
      // final response = await apiService.registerUser(email, name, password);
      return true;
    } catch (error) {
      throw Exception("Failed to sign up: $error");
    }
  }
}
