import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/models/product.dart';

class CategoryProductsController extends HomeController {
  @override
  List<Product> listProducts = [];

  String category = '';

  Future<void> getProductsByCategory(String category) async {
    this.category = category;

    changeProductsState(ProductsViewState.loading);

    await Future.delayed(const Duration(seconds: 3));

    try {
      listProducts = mockJson.productsJson
          .map((item) => Product.fromJson(item))
          .where((product) => product.category == category)
          .toList();

      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  Future<void> getProductsByName(String name) async {
    changeProductsState(ProductsViewState.loading);

    try {
      listProducts = mockJson.productsJson
          .map((item) => Product.fromJson(item))
          .where(
            (product) =>
                product.category == category &&
                product.name.toLowerCase().contains(name.toLowerCase()),
          )
          .toList();

      changeProductsState(ProductsViewState.sucess);
    } catch (e) {
      changeProductsState(ProductsViewState.error);
    }
  }

  void _restoreCategoryProducts() {
    listProducts = mockJson.productsJson
        .map((item) => Product.fromJson(item))
        .where((product) => product.category == category)
        .toList();

    changeProductsState(ProductsViewState.sucess);
  }

  Future<void> searchProducts(String name) async {
    if (name.isEmpty) {
      _restoreCategoryProducts();
    } else {
      await getProductsByName(name);
    }
  }
}
