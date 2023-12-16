import 'package:flutter/material.dart';
import 'package:quickly_platform_assignment/screens/product_description.dart';

import '../screens/login.dart';
import '../screens/products_screen.dart';
import '../screens/splash_screen.dart';
import 'route_constant.dart';

class RoutersPath {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments != null ? settings.arguments as Map : {};

    switch (settings.name) {
      case RoutesConstant.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen(
            isLogin: true,
          );
        });
      case "/":
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
      case RoutesConstant.signUpScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen(
            isLogin: false,
          );
        });
      case RoutesConstant.productListScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const ProductListScreen();
        });
      case RoutesConstant.productDescScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return ProductDescription(
            id: args["id"],
          );
        });
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
    }
  }
}
