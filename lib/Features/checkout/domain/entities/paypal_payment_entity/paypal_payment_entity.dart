import 'package:fruit_market/Features/checkout/domain/entities/order_input_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'itemList': itemList?.toJson(),
  };

  factory PaypalPaymentEntity.fromEntity(OrderInputEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: 'PayPal Payment',
      itemList: ItemList.fromEntity(entity.cartEntity.cartList),
    );
  }
}
