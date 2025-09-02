import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child: Text(
        textAlign: TextAlign.center,
        'لديك ${context.watch<CartCubit>().cartEntity.cartList.length} منتجات في سله التسوق',
        style: AppTextStyles.regular13,
      ),
    );
  }
}
