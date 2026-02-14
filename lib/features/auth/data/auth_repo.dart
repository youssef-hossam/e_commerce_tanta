import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/core/networking/api_error_model.dart';
import 'package:e_commerce_tanta/features/auth/data/auth_web_service.dart';

class AuthRepo {
  final AuthWebService authWebService;

  AuthRepo({required this.authWebService});
  Future<ResponseModel> loginRepo(String email, String password) async {
    Response response = await authWebService.login(email, password);
    ResponseModel responseModel = ResponseModel.fromJson(response.data);

    return responseModel;
  }
}
