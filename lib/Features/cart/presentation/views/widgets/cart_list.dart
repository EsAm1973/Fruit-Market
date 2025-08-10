import 'package:flutter/material.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder:
            (context, index) => const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: CartListItem(),
            ),
      ),
    );
  }
}
