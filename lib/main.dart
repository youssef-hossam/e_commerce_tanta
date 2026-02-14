import 'package:e_commerce_tanta/bloc_observer.dart';
import 'package:e_commerce_tanta/core/service_locator.dart';
import 'package:e_commerce_tanta/features/auth/presentation/cubit/log_in_cubit.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as https;

void main() async {
//
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  setupLocator();

  //     .logIn(email: 'mohamedabdelmaboud03@gmail.com', password: 'asd246810#D');
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: MaterialApp(
          // routes: {},
          debugShowCheckedModeBanner: false,
          home: LoginView()),
    );
  }
}
