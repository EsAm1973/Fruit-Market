import 'package:fruit_market/Features/cart/domin/entities/cart_entity.dart';
import 'package:fruit_market/Features/checkout/domain/entities/shippimg_address_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippimgAddressEntity shippingAddress = ShippimgAddressEntity();

  OrderEntity({required this.cartEntity, this.payWithCash, required this.uID});
}
