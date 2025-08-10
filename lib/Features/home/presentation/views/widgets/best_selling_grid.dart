import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/fruit_item.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

class BestSellingGrid extends StatelessWidget {
  const BestSellingGrid({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 163 / 190,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return FruitItem(product: product);
      },
    );
  }
}
