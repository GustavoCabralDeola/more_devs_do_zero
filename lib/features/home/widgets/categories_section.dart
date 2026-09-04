import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/category_product/pages/categoryProducts_page.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/shared/widgets/app_loading_animation.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesSection extends StatelessWidget {
  final CategoriesViewState categoryViewState;
  final List<Category> categories;
  const CategoriesSection({
    super.key,
    required this.categoryViewState,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: switch (categoryViewState) {
        CategoriesViewState.error => const Text(
          'Problema ao resgatar categorias',
        ),

        _ => SizedBox(
          child: AppLoadingAnimation(
            enabled: categoryViewState == CategoriesViewState.loading,
            itemCount: getCategoriesViewList().length,
            height: 150,
            itemBuilder: (context, index) {
              final Category category = getCategoriesViewList()[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryProductsPage(category: category),
                    ),
                  );
                },

                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 76,
                        child: Skeleton.replace(
                          replacement: Bone.circle(size: 70),
                          child: Image.network(category.imageUrl),
                        ),
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
                ),
              );
            },
          ),
        ),
      },
    );
  }

  List<Category> getCategoriesViewList() {
    return categoryViewState == CategoriesViewState.loading
        ? List.generate(5, (index) {
            return Category(name: 'asdasd', imageUrl: 'asdasd');
          })
        : categories;
  }
}
