import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/models/product.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Skeleton.replace(
            replacement: Bone(height: 150, width: 150),
            child: Container(
              height: 150,

              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            product.brand,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(product.name, style: const TextStyle(fontSize: 16)),
          Text('\$${product.price}', style: TextStyle(color: AppColors.green)),
        ],
      ),
    );
  }
}
