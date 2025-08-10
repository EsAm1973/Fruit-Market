import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            // right: 0,
            // top: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          const SizedBox(height: 24),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CachedNetworkImage(
                  imageUrl: product.imageUrl!,
                  height: 90,
                  placeholder:
                      (context, url) => const Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => const Center(
                        child: Icon(Icons.broken_image, size: 36),
                      ),
                ),
                ListTile(
                  title: Text(
                    product.productName,
                    style: AppTextStyles.semibold16.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price} جنية ',
                          style: AppTextStyles.bold13.copyWith(
                            color: const Color(0xFFF4A91F),
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppTextStyles.bold13.copyWith(
                            color: const Color(0xFFF8C76D),
                          ),
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppTextStyles.semibold13.copyWith(
                            color: const Color(0xFFF8C76D),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
