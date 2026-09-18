import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/product_cart.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';

class CartBottomBar extends StatelessWidget {
  CartBottomBar({required this.products});

  final List<ProductCart> products;

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (final product in products) {
      total += product.price * product.quantity;
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black)),
      ),
      child: Row(
        children: [
          Text(
            'R\$ ${total.toStringAsFixed(2)}',
            style: AppTextStyle.totalPrice,
          ),

          Spacer(),

          SizedBox(
            width: 128,
            height: 38,
            child: AppElevatedButton(
              label: 'Continuar',
              type: ButtonType.filled,
              onPressed: products.isEmpty ? null : () {},
            ),
          ),
        ],
      ),
    );
  }
}
