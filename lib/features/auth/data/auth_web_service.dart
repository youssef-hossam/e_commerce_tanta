import 'package:dio/dio.dart';

class AuthWebService {
  final String _baseUrl = 'https://marketi-app.onrender.com';
  final String _path = '/api/v1/auth/';
  final String _endPoint = 'signIn';
  final Dio dio;

  AuthWebService({required this.dio});
  Future<Response> login(String email, String password) async {
    Response response = await dio.post('$_baseUrl$_path$_endPoint', data: {
      "email": email,
      "password": password,
    });
    return response;
  }

  // ResponseModel responseModel = ResponseModel.fromJson(response.data);

  // // set token in secure storage
  // // encoding the token to UTF-8 to make it more secure
  // CacheHelper.setSecureData(
  //     key: CacheConstants.token, value: responseModel.token!);
}
