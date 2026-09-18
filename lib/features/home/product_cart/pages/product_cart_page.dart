import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/product_cart/controllers/product_cart_controller.dart';
import 'package:more_devs_do_zero/features/home/product_cart/widgets/cart_bottom_bar.dart';
import 'package:more_devs_do_zero/features/home/product_cart/widgets/product_cart_item.dart';
import 'package:provider/provider.dart';

class ProductCartPage extends StatelessWidget {
  static String route = '/cart';

  const ProductCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Carrinho',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Consumer<ProductCartController>(
        builder: (context, controller, child) {
          final products = controller.productsCart;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(16, 50, 16, 16),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCartItem(
                      product: product,
                      controller: controller,
                    );
                  },
                ),
              ),

              CartBottomBar(products: products),
            ],
          );
        },
      ),
    );
  }
}
