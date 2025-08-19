import 'package:dio/dio.dart';
import '../network/network.dart';

class ApiService {
  final Dio _dio = Network().dio;

  // Function to get data (GET request)
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  // Function to post data (POST request)
  Future<Response> post(
      String path, {
        Map<String, dynamic>? data,
        FormData? formData,
        Options? options,
      }) async {
    try {
      // If formData is provided, use it for the POST request
      if (formData != null) {
        return await _dio.post(path, data: formData, options: options);
      }
      // If regular data is provided, send it with options (headers)
      return await _dio.post(path, data: data, options: options);
    } catch (e) {
      rethrow;
    }
  }

  // Function to put data (PUT request)
  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  // Function to delete data (DELETE request)
  Future<Response> delete(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.delete(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.patch(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

}