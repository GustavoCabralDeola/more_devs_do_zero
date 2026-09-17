import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/category_product/controllers/category_products_controller.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/product_cart/controllers/product_cart_controller.dart';
import 'package:more_devs_do_zero/features/home/product_cart/pages/product_cart_page.dart';
import 'package:more_devs_do_zero/features/home/widgets/categories_section.dart';
import 'package:more_devs_do_zero/features/home/widgets/products_section.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>()
        ..getCategories()
        ..getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<HomeController>(
            builder: (context, controller, child) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProductCartPage.route);
                    },
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),

                  Positioned(
                    right: 5,
                    top: 2,
                    child: Consumer<ProductCartController>(
                      builder: (context, categoryController, child) {
                        return Visibility(
                          visible: categoryController.totalQuantity > 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              categoryController.totalQuantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá ${loginController.user!.nome}',
              style: AppTextStyle.tittle,
            );
          },
        ),
      ),

      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          print('NAVIEW ${homeController.categoriesViewState}');
          print('NAVIEW ${homeController.productsViewState}');

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Categorias',
                        style: AppTextStyle.tittle,
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),

              CategoriesSection(
                categories: homeController.listCategories,
                categoryViewState: homeController.categoriesViewState,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Produtos',
                        textAlign: TextAlign.left,
                        style: AppTextStyle.tittle,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),

              ProductsSection(
                listProducts: homeController.listProducts,
                productViewState: homeController.productsViewState,
              ),

              SizedBox(height: 100),

              AppElevatedButton(
                label: 'carregar',
                type: ButtonType.filled,
                onPressed: () {
                  homeController
                    ..getCategories()
                    ..getProducts();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
