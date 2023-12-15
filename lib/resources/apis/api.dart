import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class APIClass {
  String baseUrl = "https://flutter-api-a4y8j.ondigitalocean.app/";
  var dio = Dio();
  getRequest({required String endPoint}) async {
    try {
      var response = await dio.request(
        baseUrl + endPoint,
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        return {
          "statusCode": response.statusCode,
          "message": (json.encode(response.data))
        };
      } else {
        return {
          "statusCode": response.statusCode,
          "message": (response.statusMessage)
        };
      }
    } on SocketException {
      return {"statusCode": 400, "message": "No Interne Connection"};
    } catch (e) {
      if (e is DioException) {
        return {"statusCode": 400, "message": e.message};
      }
      print(e);
    }
  }

  postRequest() {}
}
