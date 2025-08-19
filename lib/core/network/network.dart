import 'package:dio/dio.dart';

import '../services/reset_token_storage.dart';
import '../services/token_storage.dart';
import '../utils/api_end_point.dart';

class Network {
  static final Network _instance = Network._internal();
  factory Network() => _instance;
  late Dio dio;

  Network._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // Remove Authorization from here
      },
    );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await TokenStorage().getToken();
        final refreshToken = await ResetTokenStorage().getToken();
        print('Injected Token: $token');
        print('Injected Reset Token: $refreshToken');
        if (token != null && refreshToken == null) {
          options.headers['Authorization'] = 'Bearer $token';
        } else if (refreshToken != null) {
          options.headers['Authorization'] = 'Bearer $refreshToken';
        } else {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    // For debug logging
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
    ));
  }

}