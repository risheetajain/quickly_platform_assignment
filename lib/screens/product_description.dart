import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickly_platform_assignment/common/decoration.dart';
import 'package:quickly_platform_assignment/models/products.dart';
import 'package:quickly_platform_assignment/resources/apis/api.dart';
import 'package:quickly_platform_assignment/resources/apis/end_points.dart';
import 'package:quickly_platform_assignment/widgets/my_button.dart';

class ProductDescription extends StatefulWidget {
  final String id;
  const ProductDescription({super.key, required this.id});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  ProductModel product = ProductModel();
  String? error;
  @override
  void initState() {
    super.initState();
    APIClass.getRequest(EndPoint.getProductByID + widget.id).then((value) {
      if (value["status"]) {
        product = ProductModel.fromJson(value["body"]);
      } else {
        error = value["message"];
        Fluttertoast.showToast(msg: value["message"]);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: error != null ? null : Text(product.name ?? "")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: error != null
              ? Center(
                  child: Text(error!),
                )
              : SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/no_product_image.png',
                          height: size.height * 0.45,
                          fit: BoxFit.cover,
                          width: size.width,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                     
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name ?? "",
                                style: largeTitle,
                              ),
                              Text(
                                product.description ?? "",
                                style: smallTitle,
                              ),
                              Text(
                                "Price: Only ₹${product.price ?? 0}",
                                style: midTitle,
                              )
                            ],
                          ),
                        )
                      ]),
                ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyButton(title: "Buy Now", onTap: () {}),
          const SizedBox(
            width: 12,
          ),
          MyButton(title: "Add to Cart", onTap: () {}),
        ],
      ),
    );
  }
}
