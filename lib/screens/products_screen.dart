import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickly_platform_assignment/providers/product_providers.dart';

import '../models/products.dart';
import '../resources/shared_pref.dart';
import '../routes/route_constant.dart';
import '../widgets/product_card.dart';
import '../widgets/widgets.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Widgets.areYouSureDialogBox(
                    context: context,
                    onSuccess: () {
                      SharedPref.clearData();

                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesConstant.splashScreen, (route) {
                        return false;
                      });
                    },
                    keyword: "Logout");
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          List<ProductModel> productLists = value.productLists;
          return productLists.isEmpty
              ? Center(
                  child: Image.asset('assets/no_product.png'),
                )
              : ListView.builder(
                  itemCount: productLists.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      product: productLists[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
