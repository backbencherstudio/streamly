class ApiEndPoint {

  static const String baseUrl = 'https://decisions-spanish-protecting-anime.trycloudflare.com';

  /// auth
  static const String login = '$baseUrl/api/users/login';
  static const String register = '$baseUrl/api/users/registerUser';
  static const String getMe = '$baseUrl/api/users/get-me';

}