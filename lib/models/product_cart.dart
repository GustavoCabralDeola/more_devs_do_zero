import 'package:more_devs_do_zero/models/product.dart';

class ProductCart extends Product {
  int quantity;

  ProductCart({
    required super.name,
    required super.brand,
    required super.price,
    required super.imageUrl,
    required super.category,
    this.quantity = 1,
  });
  //adicionar a quantidade de produtos ao clicar no produto tanto no homecontroller quanto no categoryProductsController
  //fazer com que ele salve a quantidade de produtos no carrinho, e que ao clicar no produto novamente, ele aumente a quantidade do mesmo produto no carrinho e no bottomsheet
  // mesma coisa quando clicar para remover o produto do carrinho, ele deve diminuir a quantidade do mesmo produto no carrinho, e quando a quantidade chegar a 0,
  //ele deve remover o produto do carrinho e do bottomsheet
  // ao remover o produto adicionar um dialog de confirmação de remoção do produto.
}
