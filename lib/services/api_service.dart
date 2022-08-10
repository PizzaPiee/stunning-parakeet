import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://b518-151-21-48-88.eu.ngrok.io";
  var dio = Dio();

  void signUp(String email, String password) async {
    try {
      var body = {'email': email, 'password': password};
      var response = await dio.post('$_baseUrl/auth/signup',
          options: Options(contentType: Headers.formUrlEncodedContentType),
          data: body);
      print(response.data.toString());
      print(response.statusCode);
    } on DioError catch (e) {
      print(e.response?.data['error']);
      print(e.response?.statusCode);
    }
  }
}
