import 'package:flutter/material.dart';

import '../resources/shared_pref.dart';
import '../routes/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      SharedPref.getLoginStatus().then((value) {
        if (value) {
          Navigator.of(context).pushReplacementNamed(RoutesConstant.homeScreen);
        } else {
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstant.signUpScreen);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FlutterLogo());
  }
}
