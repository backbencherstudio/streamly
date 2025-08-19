import 'package:streamly/core/utils/api_end_point.dart';
import 'package:streamly/data/model/auth/user/user_model.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/token_storage.dart';

class UserRepository {
  
  final ApiService _apiService = ApiService();
  final TokenStorage tokenStorage = TokenStorage();
  
  Future<UserModel> getUser() async {
    final response = await _apiService.get(ApiEndPoint.getMe);

    if (response.statusCode == 200) {
      final user = response.data['data'];
      print('User data: $user');

      if (user != null) {
        return UserModel.fromJson(user);
      } else {
        throw Exception('User data is null');
      }
    } else {
      throw Exception('Failed to get user: ${response.statusCode}');
    }
  }
}