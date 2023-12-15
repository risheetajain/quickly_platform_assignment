import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return productCard();
        },
      ),
    );
  }
}

productCard() {
  return const Card(
      child: ListTile(
    title: Text("Jeans"),
    subtitle: Text("Jeans"),
    trailing: Text("200"),
  ));
}
