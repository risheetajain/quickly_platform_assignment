import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIClass {
  static String baseUrl = "https://flutter-api-a4y8j.ondigitalocean.app/";
  static var dio = Dio();

  static Future<Map<String, dynamic>> getRequest(
    String endPoint,
  ) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var response = await dio.get(baseUrl + endPoint,
          options: Options(
            headers: headers,
          ));

      final x = response.data;
      if (response.statusCode! < 400) {
        return {"body": x, "status": true};
      } else if (response.statusCode! > 400 && response.statusCode! < 500) {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      } else {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      }
    } on TimeoutException {
      return {
        "status": "false",
        "message": 'The connection has timed out, Please try again!'
      };
    } on SocketException {
      debugPrint("Internet Issue! No Internet connection 😑");

      return {
        "status": "false",
        "message": "Internet Issue! No Internet connection 😑"
      };
    } catch (e) {
      debugPrint("Error: $e");
      return {"status": "false", "message": "Connection Problem"};
    }
  }

 static Future<Map<String, dynamic>> postRequest(
      {required String endPoint, required Map<String, dynamic> myData}) async {
    try {
      var response = await dio.post(baseUrl + endPoint,
          options: Options(
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
          ),
          data: myData);
      final x = response.data;
      if (response.statusCode! < 400) {
        return {"body": x, "status": true};
      } else if (response.statusCode! > 400 && response.statusCode! < 500) {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      } else {
        return {
          "status": "error",
          "message": x["message"] ?? "Something went wrong"
        };
      }
    } on TimeoutException {
      return {
        "status": "false",
        "message": 'The connection has timed out, Please try again!'
      };
    } on SocketException {
      debugPrint("Internet Issue! No Internet connection 😑");

      return {
        "status": "false",
        "message": "Internet Issue! No Internet connection 😑"
      };
    } catch (e) {
      debugPrint("Error: $e");
      return {"status": "false", "message": "Connection Problem"};
    }
  }
}
