class ApiEndPoint {

  static const String baseUrl = 'https://decisions-spanish-protecting-anime.trycloudflare.com';

  static String ImagePath(String url) => '$baseUrl/$url';

  /// auth
  static const String login = '$baseUrl/api/users/login';
  static const String register = '$baseUrl/api/users/registerUser';
  static const String getMe = '$baseUrl/api/users/get-me';
  static const String forget_password = '$baseUrl/api/users/forget_pass';
  static const String verify_otp = '$baseUrl/api/users/checkForgetPassOtp';
  static const String reset_password = '$baseUrl/api/users/resetPass';

  /// profile
  static const String updateUserProfileData = '$baseUrl/api/users/update-user-details';
  static const String updateUserProfileImage = '$baseUrl/api/users/update-image';

}