import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/models/product.dart';

class CategoryProductsController extends HomeController {
  @override
  List<Product> listProducts = [];
  bool isActiveCheckBox = false;

  String category = '';
  String currentSearchTerm = '';

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

  Future<void> getProductsBySearch(String searchTerm) async {
    changeProductsState(ProductsViewState.loading);

    try {
      listProducts = mockJson.productsJson
          .map((item) => Product.fromJson(item))
          .where((product) {
            if (product.category != category) {
              return false;
            }
            final searchLower = searchTerm.toLowerCase();

            if (isActiveCheckBox) {
              return product.brand.toLowerCase().contains(searchLower);
            } else {
              return product.name.toLowerCase().contains(searchLower);
            }
          })
          .toList();

      print(
        'Nome encontrado? ${listProducts.any((p) => p.name.toLowerCase().contains(name.toLowerCase()) && p.category == category)}',
      );
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
    currentSearchTerm = name;
    if (name.isEmpty) {
      _restoreCategoryProducts();
    } else {
      await getProductsBySearch(name);
    }
  }

  void changeActiveCheckBox(bool value) {
    isActiveCheckBox = !isActiveCheckBox;
    print('isActiveCheckBox: $isActiveCheckBox');
    searchProducts(currentSearchTerm);
    notifyListeners();
  }
}
