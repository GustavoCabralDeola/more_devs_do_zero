import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
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
