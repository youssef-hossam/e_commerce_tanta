import 'package:e_commerce_tanta/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:e_commerce_tanta/features/auth/presentation/views/widgets/obscure_icon.dart';
import 'package:e_commerce_tanta/features/home/nav_bar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool obscureText = false;

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    } else if (val.length > 8) {
                      return 'password must be at least 8 characters';
                    }
                  },
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NavBar()),
                      );
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
