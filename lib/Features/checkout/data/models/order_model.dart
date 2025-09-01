import 'package:fruit_market/Features/checkout/data/models/order_product_model.dart';
import 'package:fruit_market/Features/checkout/data/models/shipping_model.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String uID;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.uID,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  toJson() => {
    'uID': uID,
    'totalPrice': totalPrice,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };

  factory OrderModel.fromEntity(OrderEntity orderEntity) => OrderModel(
    uID: orderEntity.uID,
    totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
    shippingAddressModel: ShippingAddressModel.fromEntity(
      orderEntity.shippingAddress,
    ),
    orderProducts:
        orderEntity.cartEntity.cartList
            .map((e) => OrderProductModel.fromEntity(e))
            .toList(),
    paymentMethod: orderEntity.payWithCash! ? 'cash' : 'paypal',
  );
}
