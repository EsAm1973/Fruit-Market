import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 80,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesWatermelonTest),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('بطيخ', style: AppTextStyles.bold13),
                    Icon(Icons.delete_outline_outlined, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '3 كم',
                  style: AppTextStyles.regular13.copyWith(
                    color: const Color(0xFFF4A91F),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF1B5E37) /* Green1-500 */,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    const Text('2', style: AppTextStyles.bold16),
                    const SizedBox(width: 16),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF3F5F7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFFF1F1F5),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: const Icon(Icons.remove, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      '60 جنيه',
                      style: AppTextStyles.bold16.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
