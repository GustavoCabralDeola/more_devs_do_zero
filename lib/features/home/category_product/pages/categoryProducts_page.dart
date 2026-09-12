import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/category_product/controllers/categoryProducts_controller.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/widgets/product_card.dart';
import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_bottom_sheet.dart';
import 'package:more_devs_do_zero/shared/widgets/app_check_box.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_filter_dialog.dart';
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 26, right: 26),
                child: AppTextField(
                  hintText: 'Buscar Produtos',
                  onChanged: (value) {
                    controller.searchProducts(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      AppFilterDialog.show(
                        context: context,
                        child: StatefulBuilder(
                          builder:
                              (
                                BuildContext context,
                                StateSetter setStateDialog,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Filtrar por:',
                                        style: AppTextStyle.tittle,
                                      ),

                                      Row(
                                        children: [
                                          Text('Brand'),

                                          Spacer(),

                                          AppCheckBox(
                                            value: controller.isActiveCheckBox,
                                            onChanged: (value) {
                                              controller.changeActiveCheckBox(
                                                value!,
                                              );
                                              setStateDialog(() {});
                                            },
                                          ),

                                          SizedBox(height: 24),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: SizedBox(
                                          width: 100,
                                          child: AppElevatedButton(
                                            label: 'Ok',
                                            type: ButtonType.filled,
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                        ),
                      );
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ),
              ),

              Expanded(
                child: Skeletonizer(
                  enabled:
                      controller.productsViewState == ProductsViewState.loading,
                  child: GridView.builder(
                    // padding: const EdgeInsets.all(10),
                    itemCount: controller.listProducts.length,

                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                      mainAxisExtent: 265,
                      crossAxisSpacing: 0,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.listProducts[index];
                      return Center(
                        child: ProductCard(controller.productsViewState, () {
                          _showProductBottomSheet(context, product);
                        }, product: product),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
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
}
