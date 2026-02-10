import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/log_in.dart';
import 'package:e_commerce_tanta/features/home/nav_bar.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as https;

void main() async {
  // print("response data ${response.data}");
  // print("response status code ${response.statusCode}");

  // request of http that retrieve data from api  ( products )

  // var url = Uri.https('dummyjson.com', '/products');
  // var response = await https.get(url);
  // print(response.request);
  // print(response.body);
  // print(response.statusCode);

//

  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(),
    );
  }
}
