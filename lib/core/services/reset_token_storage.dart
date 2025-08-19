import 'package:shared_preferences/shared_preferences.dart';

class ResetTokenStorage {
  static const _key = "reset-token";

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token); // Save the token
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key); // Retrieve the token
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key); // Clear the token
  }
}