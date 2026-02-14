import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/core/networking/dio_factory.dart';
import 'package:e_commerce_tanta/features/auth/data/auth_repo.dart';
import 'package:e_commerce_tanta/features/auth/data/auth_web_service.dart';
import 'package:get_it/get_it.dart';

// Global Variable for GetIt
GetIt getIt = GetIt.instance;
setupLocator() {
  getIt.registerSingleton<Dio>(DioFactory().dio);
  getIt.registerSingleton(AuthWebService(dio: getIt<Dio>()));

  getIt.registerSingleton(AuthRepo(authWebService: getIt<AuthWebService>()));
}
