import 'package:fruit_market/Features/checkout/domain/entities/order_input_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory Details.fromEntity(OrderInputEntity order) => Details(
    subtotal: order.cartEntity.calculateTotalPrice().toString(),
    shipping: order.calculateShippingCost().toString(),
    shippingDiscount: order.calculateShippingDiscount(),
  );
}
