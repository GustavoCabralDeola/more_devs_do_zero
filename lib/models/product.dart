import 'package:more_devs_do_zero/models/category.dart';

class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;
  final String category;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['brand'],
      brand: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}
