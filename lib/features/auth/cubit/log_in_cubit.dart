import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/core/networking/api_error_handler.dart';
import 'package:e_commerce_tanta/core/networking/api_error_model.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final String _baseUrl = 'https://marketi-app.onrender.com';
  final String _path = '/api/v1/auth/';
  final String _endPoint = 'signIn';

  LogInCubit() : super(LogInInitial());

  Future<void> logIn({required String email, required String password}) async {
    try {
      emit(LogInLoading());

      Response response = await Dio().post('$_baseUrl$_path$_endPoint', data: {
        "email": email,
        "password": password,
      });

      ResponseModel responseModel = ResponseModel.fromJson(response.data);
      print("object ${responseModel.message}");
      emit(LogInSuccess());
    } on Exception catch (e) {
      emit(LogInError(ApiErrorHandler.handle(e)));
    }
  }
}
