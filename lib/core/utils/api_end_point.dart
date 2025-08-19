class ApiEndPoint {

  static const String baseUrl = 'https://decisions-spanish-protecting-anime.trycloudflare.com';

  /// auth
  static const String login = '$baseUrl/api/users/login';
  static const String register = '$baseUrl/api/users/registerUser';
  static const String getMe = '$baseUrl/api/users/get-me';
  static const String forget_password = '$baseUrl/api/users/forget_pass';
  static const String verify_otp = '$baseUrl/api/users/checkForgetPassOtp';
  static const String reset_password = '$baseUrl/api/users/resetPass';

}