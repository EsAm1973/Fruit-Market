import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      centerTitle: true,
      title: const Text('السلة',style: AppTextStyles.bold19,),
    ),body: const SafeArea(child: CartViewBody()));
  }
}
