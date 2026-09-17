import 'package:flutter/material.dart';

class ProductCartPage extends StatelessWidget {
  static String route = '/cart';

  const ProductCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho'), centerTitle: true),
      body: const SizedBox(),
    );
  }
}
