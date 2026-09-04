import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/widgets/app_loading_animation.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

              return ProductCard(product: product);
            },
          ),
        ),
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
