import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/auth/cubit/log_in_cubit.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/log_in.dart';
import 'package:e_commerce_tanta/features/home/nav_bar.dart';
import 'package:e_commerce_tanta/features/products/cubit/productss_cubit.dart';
import 'package:e_commerce_tanta/features/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as https;

void main() async {
//
  WidgetsFlutterBinding.ensureInitialized();
  // LogInCubit()
  //     .logIn(email: 'mohamedabdelmaboud03@gmail.com', password: 'asd246810#D');
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInCubit>(create: (context) => LogInCubit()),
        BlocProvider<ProductsCubit>(
            create: (context) => ProductsCubit()..getAllProducts()),
      ],
      child: MaterialApp(
          // routes: {},
          debugShowCheckedModeBanner: false,
          home: LoginView()),
    );
  }
}
