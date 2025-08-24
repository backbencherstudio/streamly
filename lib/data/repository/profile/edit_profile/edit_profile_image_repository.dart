import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import '../../../../core/services/token_storage.dart';
import '../../../../core/utils/api_end_point.dart';

class EditProfileImageRepository {

  Future<bool> updateUserDetails(File? image) async {
    final TokenStorage _tokenStorage = TokenStorage();
    final url = Uri.parse(ApiEndPoint.updateUserProfileImage);

    try {
      final accessToken = await _tokenStorage.getToken();
      if (accessToken == null) {
        throw Exception('Access token is null');
      }

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = 'Bearer $accessToken';

      if (image != null) {
        debugPrint('Uploading image...');
        String? mimeType = lookupMimeType(image.path);
        String filename = path.basename(image.path);
        request.files.add(
          await http.MultipartFile.fromPath(
            'profilePicture',
            image.path,
            filename: filename,
            contentType: mimeType != null ? MediaType.parse(mimeType) : null,
          ),
        );

      } else {
        debugPrint('No image selected to upload.');
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        debugPrint('update user details added successfully. Status: ${response.statusCode}');
        debugPrint('Response Body: $responseBody');
        return true;
      } else {
        debugPrint('Failed to add details. Status: ${response.statusCode}');
        debugPrint('Request URL: ${request.url}');
        debugPrint('Request Headers: ${request.headers}');
        debugPrint('Request Fields: ${request.fields}');
        debugPrint('Response Body: $responseBody');
        throw Exception('Failed to save profile image: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error adding details: $error');
      throw Exception('Failed to save profile image: $error');
    }
  }
}
