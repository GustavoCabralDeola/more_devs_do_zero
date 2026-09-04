import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/category_product/controllers/categoryProducts_controller.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_text_field.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryProductsPage extends StatefulWidget {
  final Category category;

  static String route = '/category';

  CategoryProductsPage({super.key, required this.category});

  @override
  State<CategoryProductsPage> createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CategoryProductsController>().getProductsByCategory(
        widget.category.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name, style: AppTextStyle.tittle),
        centerTitle: true,
        actions: [Icon(Icons.shopping_cart_outlined)],
      ),

      body: Consumer<CategoryProductsController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              AppTextField(
                hintText: 'Buscar Produtos',
                onChanged: (value) {
                  controller.searchProducts(value);
                },
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
              Expanded(
                child: Skeletonizer(
                  enabled:
                      controller.productsViewState == ProductsViewState.loading,
                  child: Center(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: controller.listProducts.length,

                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width / 2,
                        mainAxisExtent: 265,
                        crossAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) {
                        final product = controller.listProducts[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
