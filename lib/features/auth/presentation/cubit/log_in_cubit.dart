import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/config/cache/cache_constants.dart';
import 'package:e_commerce_tanta/config/cache/cache_helper.dart';
import 'package:e_commerce_tanta/core/networking/api_error_handler.dart';
import 'package:e_commerce_tanta/core/networking/api_error_model.dart';
import 'package:e_commerce_tanta/core/service_locator.dart';
import 'package:e_commerce_tanta/features/auth/data/auth_repo.dart';
import 'package:e_commerce_tanta/features/auth/data/auth_web_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  // AuthWebService authWebService = AuthWebService();

  AuthRepo authRepo = getIt<AuthRepo>();
  Future<void> logIn({required String email, required String password}) async {
    try {
      emit(LogInLoading());
      ResponseModel responseModel = await authRepo.loginRepo(email, password);
      log(responseModel.token!);
      // set token in secure storage
      CacheHelper.setSecureData(
          key: CacheConstants.token, value: responseModel.token!);

      emit(LogInSuccess());
    } on Exception catch (e) {
      emit(LogInError(ApiErrorHandler.handle(e)));
    }
  }
}
