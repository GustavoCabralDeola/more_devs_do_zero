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

              return InkWell(
                // Evita abrir o modal se a tela ainda estiver carregando os skeletons
                onTap: () {
                  print('Entrei');
                  if (productViewState != ProductsViewState.loading) {
                    print('Entrei no if');
                    _showProductBottomSheet(context, product);
                  }
                },
                child: ProductCard(product: product),
              );
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
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Text('Marca: ${product.brand}'),
                    const SizedBox(height: 8),
                    Text('Preço: R\$ ${product.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 8),
                    Text('Categoria: ${product.category}'),
                    const SizedBox(height: 8),
                    if (product.description != null)
                      Text('Descrição: ${product.description}'),
                  ],
                ),
              ),
            );
          },
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
