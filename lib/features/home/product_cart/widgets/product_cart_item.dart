import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/product_cart/controllers/product_cart_controller.dart';
import 'package:more_devs_do_zero/features/home/product_cart/widgets/quantity_button.dart';
import 'package:more_devs_do_zero/models/product_cart.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_dialog.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
    required this.product,
    required this.controller,
  });

  final ProductCart product;
  final ProductCartController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              product.imageUrl,
              width: 100,
              height: 98,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: AppTextStyle.tittle),

                const SizedBox(height: 2),

                Text(product.brand, style: AppTextStyle.subtitle),

                const Spacer(),

                Row(
                  children: [
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: () async {
                        if (product.quantity == 1) {
                          final shouldRemove = await AppDialog.show<bool>(
                            context: context,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Remover produto?',
                                  style: AppTextStyle.tittle,
                                ),

                                Text(
                                  'Deseja remover ${product.name} do carrinho?',
                                ),

                                const SizedBox(height: 13),

                                Row(
                                  children: [
                                    Expanded(
                                      child: AppElevatedButton(
                                        label: 'Cancelar',
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        type: ButtonType.outlined,
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    Expanded(
                                      child: AppElevatedButton(
                                        label: 'Remover',
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        type: ButtonType.filled,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );

                          if (shouldRemove == true) {
                            controller.removeProductFromCart(product);
                          }
                        } else {
                          controller.removeProductFromCart(product);
                        }
                      },
                    ),

                    SizedBox(
                      width: 42,
                      child: Text(
                        product.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),

                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () {
                        controller.addProductToCart(product);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Align(
            alignment: Alignment.topRight,
            child: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: AppTextStyle.price,
            ),
          ),
        ],
      ),
    );
  }
}
