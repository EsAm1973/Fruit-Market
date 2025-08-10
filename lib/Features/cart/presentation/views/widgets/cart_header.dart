import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child: const Text(
        textAlign: TextAlign.center,
        'لديك 3 منتجات في سله التسوق',
        style: AppTextStyles.regular13,
      ),
    );
  }
}
