import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final num price;
  final String? imageUrl;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
      name: cartItemEntity.product.productName,
      code: cartItemEntity.product.productCode,
      price: cartItemEntity.product.price,
      imageUrl: cartItemEntity.product.imageUrl,
      quantity: cartItemEntity.quantity,
    );
  }

  toJson() => {
    "name": name,
    "code": code,
    "price": price,
    "quantity": quantity,
    "imageUrl": imageUrl
  };
}
