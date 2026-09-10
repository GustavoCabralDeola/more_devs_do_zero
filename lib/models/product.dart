import 'package:more_devs_do_zero/models/category.dart';

class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final String? description;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      brand: json['brand'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      description: json['description'],
    );
  }
}
