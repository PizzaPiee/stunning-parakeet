// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:frontend/services/secure_storage_service.dart';
import 'package:get/get.dart';

class ApiService {
  final String _baseUrl = "https://aa64-151-21-48-88.eu.ngrok.io";
  final SecureStorageService _ssController = Get.put(SecureStorageService());
  var dio = Dio();

  Future<dynamic> signUp(String email, String password) async {
    try {
      var body = {'email': email, 'password': password};
      var response = await dio.post('$_baseUrl/auth/signup',
          options: Options(contentType: Headers.formUrlEncodedContentType),
          data: body);
      var data = response.data;
      _ssController.saveTokens(data['accessToken'], data['refreshToken']);
      return true;
    } on DioError catch (e) {
      print(e.response?.data['error']);
      print(e.response?.statusCode);
      return e.response?.data['error'];
    }
  }
}
