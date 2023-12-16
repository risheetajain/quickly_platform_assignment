import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickly_platform_assignment/providers/product_providers.dart';

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
          Provider.of<ProductProvider>(context, listen: false).getProductList();
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstant.productListScreen);
        } else {
          Navigator.of(context)
              .pushReplacementNamed(RoutesConstant.signUpScreen);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: FlutterLogo(
      size: 50,
    )));
  }
}
