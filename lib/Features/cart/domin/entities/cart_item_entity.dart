import 'package:equatable/equatable.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity product;
  int quantity;
  CartItemEntity({required this.product, this.quantity = 0});

  num calculateTotalPrice() => product.price * quantity;

  num calculateTotalWeight() => product.unitAmount * quantity;

  increaseCount() => quantity++;

  decreaseCount() => quantity--;

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}
