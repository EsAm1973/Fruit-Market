import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  factory ItemList.fromEntity(List<CartItemEntity> cartItems) =>
      ItemList(items: cartItems.map((e) => Item.fromEntity(e)).toList());
}
