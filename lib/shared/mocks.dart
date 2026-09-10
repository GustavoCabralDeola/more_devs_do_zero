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
      'description':
          'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, levemente ácido e naturalmente adocicado. Rica em vitamina C e muito versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, sobremesas e diversas receitas. Ideal para quem busca uma opção saborosa e nutritiva para o dia a dia. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Maçã',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 8.49,
      'category': 'Frutas',
      'description':
          'A maçã é uma fruta deliciosa e nutritiva, conhecida por seu sabor doce e levemente ácido. Rica em fibras, vitaminas e antioxidantes, é uma excelente opção para lanches saudáveis e sobremesas. Pode ser consumida in natura, em saladas, sucos ou assada em receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Banana',
      'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
      'price': 6.99,
      'category': 'Frutas',
      'description':
          'A banana é uma fruta tropical conhecida por seu sabor doce e textura macia. Rica em potássio, fibras e vitaminas, é uma excelente opção para lanches rápidos, smoothies e receitas diversas. Pode ser consumida in natura, assada ou utilizada em sobremesas. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Akatsu',
      'name': 'Morango',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 9.90,
      'category': 'Frutas',
      'description':
          'O morango é uma fruta saborosa e refrescante, conhecida por sua cor vibrante, aroma agradável e sabor levemente adocicado. Rico em vitaminas, fibras e antioxidantes, é uma excelente opção para lanches, sobremesas e diversas receitas. Pode ser consumido in natura, com iogurte, em vitaminas, sucos ou utilizado em doces e bolos. Produto selecionado para garantir qualidade, frescor e sabor.',
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
      'description':
          'O rabanete é uma verdura de sabor levemente picante e refrescante, conhecida por sua textura crocante e cor vibrante. Rico em vitaminas, minerais e antioxidantes, é uma excelente opção para saladas, pratos leves e acompanhamentos. Pode ser consumido cru, em conserva ou cozido em diversas receitas. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Cogumelo',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 12.19,
      'category': 'Verduras',
      'description':
          'O cogumelo é uma verdura versátil e saborosa, conhecida por sua textura macia e sabor delicado. Rico em proteínas, fibras e antioxidantes, é uma excelente opção para pratos quentes, saladas e acompanhamentos. Pode ser consumido cru, refogado, assado ou em sopas e molhos. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Natural da Terra',
      'name': 'Alface',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 5.49,
      'category': 'Verduras',
      'description':
          'A alface é uma verdura de sabor suave e refrescante, conhecida por sua textura crocante e folhas verdes. Rica em fibras, vitaminas e minerais, é uma excelente opção para saladas, sanduíches e acompanhamentos leves. Pode ser consumida crua ou utilizada em receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
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
      'description':
          'O pão francês é um clássico da padaria, conhecido por sua casca crocante e miolo macio. Perfeito para o café da manhã, lanches e refeições rápidas, é uma opção versátil e saborosa. Pode ser consumido puro, com manteiga, geleias ou utilizado em sanduíches. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Padaria do Bairro',
      'name': 'Pão de Forma',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 12.49,
      'category': 'Padaria',
      'description':
          'O pão de forma é um tipo de pão macio e versátil, ideal para sanduíches, torradas e lanches rápidos. Com uma textura leve e sabor suave, é uma opção prática para o dia a dia. Pode ser consumido puro, com recheios variados ou utilizado em receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Padaria do Bairro',
      'name': 'Croissant',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 8.99,
      'category': 'Padaria',
      'description':
          'O croissant é uma deliciosa iguaria de origem francesa, conhecida por sua massa folhada, leve e amanteigada. Com um sabor delicado e textura crocante por fora e macia por dentro, é perfeito para o café da manhã, lanches e sobremesas. Pode ser consumido puro, com recheios doces ou salgados, ou acompanhado de geleias e cremes. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Pão & Cia',
      'name': 'Baguete',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 8.75,
      'category': 'Padaria',
      'description':
          'A baguete é um pão tradicional de origem francesa, conhecida por sua casca crocante e interior macio. É uma excelente opção para cafés da manhã, lanches e refeições, podendo ser consumida pura ou acompanhada de queijos, frios, manteiga e outros recheios. Também pode ser utilizada no preparo de sanduíches e receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
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
      'description':
          'A Nutella é uma deliciosa pasta de avelã com cacau, conhecida por seu sabor irresistível e textura cremosa. Perfeita para passar em pães, torradas, waffles e panquecas, é uma opção indulgente para o café da manhã ou lanches. Pode ser utilizada em receitas de sobremesas, bolos e doces, adicionando um toque especial de sabor. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Lindt',
      'name': 'Chocolate Lindt',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 24.99,
      'category': 'Importados',
      'description':
          'O chocolate Lindt é uma iguaria premium, conhecida por sua textura suave e sabor intenso. Produzido com ingredientes de alta qualidade, oferece uma experiência de degustação única e sofisticada. Perfeito para presentear ou saborear em momentos especiais, pode ser consumido puro ou utilizado em receitas de sobremesas e confeitaria. Produto selecionado para garantir qualidade, frescor e sabor.',
    },
    {
      'brand': 'Pringles',
      'name': 'Batata Pringles',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 18.99,
      'category': 'Importados',
      'description':
          'As batatas Pringles são um lanche crocante e saboroso, conhecido por sua forma única e textura leve. Disponíveis em diversos sabores, são perfeitas para compartilhar com amigos e familiares em festas, encontros ou momentos de descontração. Podem ser consumidas puras ou acompanhadas de molhos e dips, proporcionando uma experiência de sabor divertida e deliciosa. Produto selecionado para garantir qualidade, frescor e sabor.',
    },

    {
      'brand': 'La Frontera',
      'name': 'Queijo Manchego',
      'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
      'price': 45.90,
      'category': 'Importados',
      'description':
          'O queijo Manchego é um queijo tradicional espanhol, conhecido por seu sabor marcante, textura firme e aroma característico. Produzido a partir de leite de ovelha, é uma excelente opção para tábuas de queijos, entradas e acompanhamentos. Pode ser consumido puro ou combinado com frutas, geleias e outros ingredientes. Produto selecionado para garantir qualidade, sabor e uma experiência especial.',
    },
    {
      'brand': 'La Frontera',
      'name': 'Chocolate Belga',
      'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
      'price': 32.00,
      'category': 'Importados',
      'description':
          'O chocolate belga é conhecido por sua textura cremosa, sabor intenso e alta qualidade. Produzido com ingredientes selecionados, é uma excelente opção para saborear em momentos especiais ou utilizar no preparo de sobremesas e receitas de confeitaria. Pode ser consumido puro ou combinado com frutas, castanhas e outros ingredientes. Produto selecionado para garantir qualidade, sabor e uma experiência deliciosa.',
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
      description:
          'O rabanete é uma verdura de sabor levemente picante e refrescante, conhecida por sua textura crocante e cor vibrante. Rico em vitaminas, minerais e antioxidantes, é uma excelente opção para saladas, pratos leves e acompanhamentos. Pode ser consumido cru, em conserva ou cozido em diversas receitas. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Natural da terra',
      name: 'Cogumelo',
      imageUrl: '',
      price: 12.19,
      category: 'Verduras',
      description:
          'O cogumelo é uma verdura versátil e saborosa, conhecida por sua textura macia e sabor delicado. Rico em proteínas, fibras e antioxidantes, é uma excelente opção para pratos quentes, saladas e acompanhamentos. Pode ser consumido cru, refogado, assado ou em sopas e molhos. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Natural da terra',
      name: 'Alface',
      imageUrl: '',
      price: 4.50,
      category: 'Verduras',
      description:
          'A alface é uma verdura de sabor suave e refrescante, conhecida por sua textura crocante e folhas verdes. Rica em fibras, vitaminas e minerais, é uma excelente opção para saladas, sanduíches e acompanhamentos leves. Pode ser consumida crua ou utilizada em receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Acerola',
      imageUrl: '',
      price: 7.99,
      category: 'Frutas',
      description:
          'A acerola é uma fruta tropical conhecida pelo seu sabor refrescante, levemente ácido e naturalmente adocicado. Rica em vitamina C e muito versátil, pode ser consumida in natura, utilizada em sucos, vitaminas, sobremesas e diversas receitas. Ideal para quem busca uma opção saborosa e nutritiva para o dia a dia. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Banana',
      imageUrl: '',
      price: 6.29,
      category: 'Frutas',
      description:
          'A banana é uma fruta tropical conhecida por seu sabor doce e textura macia. Rica em potássio, fibras e vitaminas, é uma excelente opção para lanches rápidos, smoothies e receitas diversas. Pode ser consumida in natura, assada ou utilizada em sobremesas. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Akatsu',
      name: 'Morango',
      imageUrl: '',
      price: 9.90,
      category: 'Frutas',
      description:
          'O morango é uma fruta saborosa e refrescante, conhecida por sua cor vibrante, aroma agradável e sabor levemente adocicado. Rico em vitaminas, fibras e antioxidantes, é uma excelente opção para lanches, sobremesas e diversas receitas. Pode ser consumido in natura, com iogurte, em vitaminas, sucos ou utilizado em doces e bolos. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Pão & Cia',
      name: 'Pão francês',
      imageUrl: '',
      price: 15.00,
      category: 'Padaria',
      description:
          'O pão francês é um clássico da padaria, conhecido por sua casca crocante e miolo macio. Perfeito para o café da manhã, lanches e refeições rápidas, é uma opção versátil e saborosa. Pode ser consumido puro, com manteiga, geleias ou utilizado em sanduíches. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'Pão & Cia',
      name: 'Baguete',
      imageUrl: '',
      price: 8.75,
      category: 'Padaria',
      description:
          'A baguete é um pão tradicional de origem francesa, conhecida por sua casca crocante e interior macio. É uma excelente opção para cafés da manhã, lanches e refeições, podendo ser consumida pura ou acompanhada de queijos, frios, manteiga e outros recheios. Também pode ser utilizada no preparo de sanduíches e receitas diversas. Produto selecionado para garantir qualidade, frescor e sabor.',
    ),
    Product(
      brand: 'La Frontera',
      name: 'Queijo Manchego',
      imageUrl: '',
      price: 45.90,
      category: 'Importados',
      description:
          'O queijo Manchego é um queijo tradicional espanhol, conhecido por seu sabor marcante, textura firme e aroma característico. Produzido a partir de leite de ovelha, é uma excelente opção para tábuas de queijos, entradas e acompanhamentos. Pode ser consumido puro ou combinado com frutas, geleias e outros ingredientes. Produto selecionado para garantir qualidade, sabor e uma experiência especial.',
    ),
    Product(
      brand: 'La Frontera',
      name: 'Chocolate Belga',
      imageUrl: '',
      price: 32.00,
      category: 'Importados',
      description:
          'O chocolate belga é conhecido por sua textura cremosa, sabor intenso e alta qualidade. Produzido com ingredientes selecionados, é uma excelente opção para saborear em momentos especiais ou utilizar no preparo de sobremesas e receitas de confeitaria. Pode ser consumido puro ou combinado com frutas, castanhas e outros ingredientes. Produto selecionado para garantir qualidade, sabor e uma experiência deliciosa.',
    ),
  ];
}
