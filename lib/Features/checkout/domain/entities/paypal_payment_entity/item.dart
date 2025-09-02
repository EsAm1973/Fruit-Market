import 'package:fruit_market/Core/helper_functions/get_currency.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory Item.fromEntity(CartItemEntity cartItemEntity) => Item(
    name: cartItemEntity.product.productName,
    quantity: cartItemEntity.quantity,
    price: cartItemEntity.product.price.toString(),
    currency: getCurrency(),
  );
}
