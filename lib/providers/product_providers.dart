import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/products.dart';
import '../resources/apis/api.dart';
import '../resources/apis/end_points.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productLists = [];
  List<ProductModel> get productLists {
    return _productLists;
  }

  getProductList() {
    APIClass.getRequest(
      EndPoint.getProduct,
    ).then((val) {
      if (val["status"]) {
        final myBody = val["body"];

        _productLists = List.generate(
            myBody.length, (index) => ProductModel.fromJson(myBody[index]));
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: val["message"]);
      }
    });
  }
}
