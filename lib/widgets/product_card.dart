import 'package:flutter/material.dart';
import 'package:quickly_platform_assignment/models/products.dart';
import 'package:quickly_platform_assignment/routes/route_constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesConstant.productDescScreen,
            arguments: {"id": product.sId});
      },
      child: Card(
          child: ListTile(
        leading: Image.asset('assets/no_product_image.png',fit: BoxFit.scaleDown,),
        title: Text(product.name ?? ""),
        subtitle: Text(product.description ?? ""),
        trailing: Text("₹${product.price ?? 0}"),
      )),
    );
  }
}
