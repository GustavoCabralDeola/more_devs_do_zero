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

  // ao remover o produto adicionar um dialog de confirmação de remoção do produto.
  // criar tela do carrinho.
  // fazer a tela de finalização de pedido.
}
