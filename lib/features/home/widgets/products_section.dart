import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_bottom_sheet.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_loading_animation.dart';

class ProductsSection extends StatelessWidget {
  final ProductsViewState productViewState;
  final List<Product> listProducts;

  const ProductsSection({
    super.key,
    required this.productViewState,
    required this.listProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: switch (productViewState) {
        ProductsViewState.error => const Text(
          'Problema ao resgatar os Produtos',
        ),

        _ => SizedBox(
          child: AppLoadingAnimation(
            height: 300,
            enabled: productViewState == ProductsViewState.loading,
            itemCount: getProductsViewList().length,
            itemBuilder: (context, index) {
              Product product = getProductsViewList()[index];

              return ProductCard(productViewState, () {
                _showProductBottomSheet(context, product);
              }, product: product);
            },
          ),
        ),
      },
    );
  }

  void _showProductBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return AppBottomSheet(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    width: double.infinity,
                    height: 195,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Text(product.name, style: AppTextStyle.tittle),

              Text(product.brand, style: TextStyle(color: AppColors.grey300)),

              if (product.description != null)
                Text('Descrição: ${product.description}'),

              const SizedBox(height: 10),

              Text.rich(
                TextSpan(
                  text: 'Preço: ',
                  style: AppTextStyle.subtitle,
                  children: [
                    TextSpan(
                      text: 'R\$ ${product.price.toStringAsFixed(2)}',
                      style: AppTextStyle.price,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              AppElevatedButton(
                label: 'Adicionar ao Carrinho',
                type: ButtonType.filled,
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  List<Product> getProductsViewList() {
    return productViewState == ProductsViewState.loading
        ? List.generate(5, (index) {
            return Product(
              brand: 'asdasd',
              name: 'asda',
              price: 0,
              imageUrl: '',
              category: 'aaas',
            );
          })
        : listProducts;
  }
}
