import 'package:fruit_market/Core/helper_functions/get_currency.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

  factory Amount.fromEntity(OrderEntity order) => Amount(
    total: order.calculateTotalPriceAfterDiscountAndShipping().toString(),
    currency: getCurrency(),
    details: Details.fromEntity(order),
  );
}
