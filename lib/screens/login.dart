import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:quickly_platform_assignment/resources/apis/api.dart';
import 'package:quickly_platform_assignment/resources/apis/end_points.dart';
import 'package:string_validator/string_validator.dart';

import '../common/decoration.dart';
import '../resources/shared_pref.dart';
import '../routes/route_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.isLogin});
  final bool isLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    isLogin = widget.isLogin;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? "Login Screen" : "Sign Up Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value != null && isEmail(value)) {
                  return null;
                }
                return "Please enter valid Email Address";
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: textFieldDecoration.copyWith(
                  hintText: "Email ID", labelText: "Email ID"),
            ),
            const Gap(10),
            TextFormField(
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              decoration: textFieldDecoration.copyWith(
                  hintText: "Password", labelText: "Password"),
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                }
                return "Please enter at least 6 characters";
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please Enter Details");
                    return;
                  }
                  APIClass.postRequest(endPoint: EndPoint.login, myData: {
                    "email": emailController.text,
                    "password": passwordController.text
                  }).then((val) {
                    if (val["status"]) {
                      Fluttertoast.showToast(
                          msg: "You have successfully logged in");
                      SharedPref.setLoginStatus();
                      Navigator.of(context).pushReplacementNamed(
                          RoutesConstant.productListScreen);
                    } else {
                      Fluttertoast.showToast(msg: val["message"]);
                    }
                  });
                },
                child: Text(
                  isLogin ? "Login" : "Sign Up",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    text: isLogin
                        ? "Create a Account? "
                        : "Already have an account? ",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    children: [
                  TextSpan(
                      text: isLogin ? "Sign Up" : "Login",
                      style: const TextStyle(
                          fontSize: 18, color: Colors.deepOrange),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        })
                ]))
          ],
        ),
      ),
    );
  }
}
