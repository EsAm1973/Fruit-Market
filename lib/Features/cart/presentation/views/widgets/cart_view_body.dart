import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartHeader(),
        const CartList(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButtom(onpressed: () {}, text: 'الدفع  120جنيه'),
        ),
      ],
    );
  }
}
