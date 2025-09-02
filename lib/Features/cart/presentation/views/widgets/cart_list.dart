import 'package:flutter/material.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartList});
  final List<CartItemEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cartList.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CartListItem(cartEntity: cartList[index]),
            ),
      ),
    );
  }
}
