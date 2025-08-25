import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';
import 'package:fruit_market/Features/checkout/domain/entities/shippimg_address_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippimgAddressEntity shippingAddress;

  OrderEntity({
    required this.cartItems,
    required this.payWithCash,
    required this.shippingAddress,
  });
}
