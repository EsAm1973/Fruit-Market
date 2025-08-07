import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/fruit_item.dart';

class BestSellingGrid extends StatelessWidget {
  const BestSellingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 163 / 190
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}
