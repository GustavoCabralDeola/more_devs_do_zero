import 'package:more_devs_do_zero/models/category.dart';
import 'package:more_devs_do_zero/models/product.dart';

class Mocks {
  final List<Map<String, dynamic>> categoriesJson = [
    {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
    {
      'name': 'Verduras',
      'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png',
    },
    {
      'name': 'Padaria',
      'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
    },
    {
      'name': 'Importados',
      'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
    },
  ];

  final List<Map<String, dynamic>> productsJson = [
    // =========================
    // FRUTAS
    // =========================
    {
      'brand': 'Akatsu',
      'name': 'Acerola',
      'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
      'price': 7.99,
      'category': 'Frutas',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Maçã',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 8.49,
      'category': 'Frutas',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Banana',
      'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
      'price': 6.99,
      'category': 'Frutas',
    },

    // =========================
    // VERDURAS
    // =========================
    {
      'brand': 'Natural da Terra',
      'name': 'Rabanete',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 10.99,
      'category': 'Verduras',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Cogumelo',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 12.19,
      'category': 'Verduras',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Alface',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 5.49,
      'category': 'Verduras',
    },

    // =========================
    // PADARIA
    // =========================
    {
      'brand': 'Padaria do Bairro',
      'name': 'Pão Francês',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 9.99,
      'category': 'Padaria',
    },
    {
      'brand': 'Padaria do Bairro',
      'name': 'Pão de Forma',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 12.49,
      'category': 'Padaria',
    },
    {
      'brand': 'Padaria do Bairro',
      'name': 'Croissant',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 8.99,
      'category': 'Padaria',
    },

    // =========================
    // IMPORTADOS
    // =========================
    {
      'brand': 'Ferrero',
      'name': 'Nutella',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 29.99,
      'category': 'Importados',
    },
    {
      'brand': 'Lindt',
      'name': 'Chocolate Lindt',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 24.99,
      'category': 'Importados',
    },
    {
      'brand': 'Pringles',
      'name': 'Batata Pringles',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 18.99,
      'category': 'Importados',
    },
  ];
  final List<Category> fakeLoadingCategories = [
    Category(
      name: 'Frutas',
      imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
    ),
    Category(
      name: 'Verduras',
      imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    ),
    Category(
      name: 'Padaria',
      imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    ),
    Category(
      name: 'Importados',
      imageUrl: 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    ),
  ];

  final List<Product> fakeLoadingProducts = [
    Product(
      brand: 'Natural da terra',
      name: 'Rabanete',
      imageUrl: '',
      price: 10.99,
      category: 'Verduras',
    ),
    Product(
      brand: 'Natural da terra',
      name: 'Cogumelo',
      imageUrl: '',
      price: 12.19,
      category: 'Verduras',
    ),
    Product(
      brand: 'Natural da terra',
      name: 'Alface',
      imageUrl: '',
      price: 4.50,
      category: 'Verduras',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Acerola',
      imageUrl: '',
      price: 7.99,
      category: 'Frutas',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Banana',
      imageUrl: '',
      price: 6.29,
      category: 'Frutas',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Morango',
      imageUrl: '',
      price: 9.90,
      category: 'Frutas',
    ),
    Product(
      brand: 'Pão & Cia',
      name: 'Pão francês',
      imageUrl: '',
      price: 15.00,
      category: 'Padaria',
    ),
    Product(
      brand: 'Pão & Cia',
      name: 'Baguete',
      imageUrl: '',
      price: 8.75,
      category: 'Padaria',
    ),
    Product(
      brand: 'La Frontera',
      name: 'Queijo Manchego',
      imageUrl: '',
      price: 45.90,
      category: 'Importados',
    ),
    Product(
      brand: 'La Frontera',
      name: 'Chocolate Belga',
      imageUrl: '',
      price: 32.00,
      category: 'Importados',
    ),
  ];
}
