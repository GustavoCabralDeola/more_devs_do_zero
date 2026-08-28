import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:more_devs_do_zero/shared/widgets/app_loading_animation.dart';
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
              SizedBox(
                child: switch (homeController.categoriesViewState) {
                  CategoriesViewState.loading => AppLoadingAnimation(
                    itemCount: homeController.listCategories.length,
                    height: 150,
                    itemHeight: 76,
                    itemWidth: 76,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Skeleton.replace(
                          width: 76,
                          height: 76,
                          child: const SizedBox(),
                        ),
                      );
                    },
                  ),

                  CategoriesViewState.error => const Text(
                    'Problema ao resgatar categorias',
                  ),

                  CategoriesViewState.sucess => SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: homeController.listCategories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final Category category =
                            homeController.listCategories[index];

                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 76,
                                child: Image.network(category.imageUrl),
                              ),
                              Text(
                                category.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
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
              SizedBox(
                width: double.infinity,

                child: switch (homeController.productsViewState) {
                  ProductsViewState.loading => AppLoadingAnimation(
                    height: 300,
                    itemCount: homeController.listProducts.length,
                    itemHeight: 148,
                    itemWidth: 148,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        child: Skeleton.replace(
                          width: 148,
                          height: 148,
                          child: const SizedBox(),
                        ),
                      );
                    },
                  ),

                  ProductsViewState.error => const Text(
                    'Problema ao resgatar os Produtos',
                  ),

                  ProductsViewState.sucess => SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: homeController.listProducts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Product product = homeController.listProducts[index];

                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 148,
                                child: Image.network(product.imageUrl),
                              ),
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                product.brand,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(color: AppColors.green),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                },
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
