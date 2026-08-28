class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['brand'],
      brand: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
