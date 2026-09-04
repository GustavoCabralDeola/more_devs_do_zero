import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 148,
            width: 148,
            child: Skeleton.replace(child: Image.network(product.imageUrl)),
          ),
          Text(
            product.name,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(product.brand, style: const TextStyle(fontSize: 16)),
          Text('\$${product.price}', style: TextStyle(color: AppColors.green)),
        ],
      ),
    );
  }
}
