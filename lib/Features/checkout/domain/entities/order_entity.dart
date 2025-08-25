import 'package:fruit_market/Features/cart/domin/entities/cart_entity.dart';
import 'package:fruit_market/Features/checkout/domain/entities/shippimg_address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final bool? payWithCash;
  final ShippimgAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    this.shippingAddress,
  });
}
