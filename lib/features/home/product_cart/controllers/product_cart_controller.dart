import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/models/product_cart.dart';

class ProductCartController extends ChangeNotifier {
  List<ProductCart> _productsCart = [];

  List<ProductCart> get productsCart => _productsCart;
  bool isLoading = false;

  //usado para mostrar um produto específico e a quantidade dele. (exemplo: ao clicar no bottomsheet mostra a quantidade q foi add no carrinho)
  int getProductQuantity(Product product) {
    final index = _productsCart.indexWhere(
      (p) => p.name == product.name && p.category == product.category,
    );

    if (index == -1) {
      return 0;
    }

    return _productsCart[index].quantity;
  }

  //totalquantity é para o ícone do carrinho
  int get totalQuantity {
    int total = 0;

    for (final product in _productsCart) {
      total += product.quantity;
    }

    return total;
  }

  Future<void> addProductToCart(Product product) async {
    isLoading = true;
    final existingProductIndex = _productsCart.indexWhere(
      (p) => p.name == product.name && p.category == product.category,
    );

    if (existingProductIndex != -1) {
      _productsCart[existingProductIndex].quantity++;
    } else {
      _productsCart.add(
        ProductCart(
          name: product.name,
          brand: product.brand,
          price: product.price,
          imageUrl: product.imageUrl,
          category: product.category,
        ),
      );
    }
    isLoading = false;
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    final existingProductIndex = _productsCart.indexWhere(
      (p) => p.name == product.name && p.category == product.category,
    );

    if (existingProductIndex != -1) {
      final existingProduct = _productsCart[existingProductIndex];
      if (existingProduct.quantity > 1) {
        existingProduct.quantity--;
      } else {
        _productsCart.removeAt(existingProductIndex);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _productsCart.clear();
    notifyListeners();
  }
}
