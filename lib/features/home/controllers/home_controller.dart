import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/mocks.dart';

enum CategoriesViewState { loading, sucess, error }

enum ProductsViewState { loading, sucess, error }

class HomeController extends ChangeNotifier {
  List<Category> listCategories = [];
  List<Product> listProducts = [];

  Mocks mockJson = Mocks();

  CategoriesViewState categoriesViewState = CategoriesViewState.loading;
  ProductsViewState productsViewState = ProductsViewState.loading;

  void changeCategoriesState(CategoriesViewState state) {
    categoriesViewState = state;
    notifyListeners();
  }

  void changeProductsState(ProductsViewState state) {
    productsViewState = state;
    notifyListeners();
  }

  Future<void> getCategories() async {
    changeCategoriesState(CategoriesViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      //deserializa e popula a nossa lista de categorias
      listCategories = mockJson.categoriesJson.map((item) {
        return Category.fromJson(item);
      }).toList();
      print(categoriesViewState);
      changeCategoriesState(CategoriesViewState.sucess);
      print(categoriesViewState);
    } catch (e) {
      //caso der erro na deserialização, emite o erro para a tela tratar
      changeCategoriesState(CategoriesViewState.error);
    }
  }

  Future<void> getProducts() async {
    changeProductsState(ProductsViewState.loading);
    await Future.delayed(Duration(seconds: 3));
    try {
      //deserializa e popula a nossa lista de categorias
      listProducts = mockJson.productsJson.map((item) {
        return Product.fromJson(item);
      }).toList();

      changeProductsState(ProductsViewState.sucess);
      print(productsViewState);
    } catch (e) {
      //caso der erro na deserialização, emite o erro para a tela tratar
      changeProductsState(ProductsViewState.error);
      print(productsViewState);
    }
  }

  // Future<void> getProductsByName() async {
  //   changeProductsState(ProductsViewState.loading);
  //   await Future.delayed(Duration(seconds: 3));

  //   try {
  //     listProducts = mockJson.productsJson.map((item){
  //       return Product.fromJson(item).name;
  //     }).first();
  //   }
  // }
}
