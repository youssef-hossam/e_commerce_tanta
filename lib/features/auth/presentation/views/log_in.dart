import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce_tanta/features/auth/cubit/log_in_cubit.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/widgets/obscure_icon.dart';
import 'package:e_commerce_tanta/features/home/nav_bar.dart';
import 'package:e_commerce_tanta/features/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureText = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ProductsView()),
              (route) => false);
        } else if (state is LogInError) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: state.message,
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login ',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  CustomTextFormField(
                    controller: emailController,
                    obscureText: false,
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'required field';
                      } else if (!val.contains('@')) {
                        return 'invalid email';
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: obscureText,
                    suffixIcon: ObscureIcon(
                      obscureText: obscureText,
                      onpressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                    ),
                    icon: Icons.lock,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'required field';
                      }
                    },
                  ),
                  SizedBox(height: 30),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       print(" hiiiiiiiiiiiiiiiiiiiiiii");
                  //       BlocProvider.of<LogInCubit>(context).logIn(
                  //         email: emailController.text,
                  //         password: passwordController.text,
                  //       );
                  //     },
                  //     child: Text("salasaaaaaaaay"))
                  BlocBuilder<LogInCubit, LogInState>(
                    builder: (context, state) {
                      return state is LogInLoading
                          ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LogInCubit>(context).logIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => NavBar()),
                                  // );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
