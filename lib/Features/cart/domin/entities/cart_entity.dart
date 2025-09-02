import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartList;

  CartEntity({required this.cartList});

  bool isExist(ProductEntity item) => cartList.any((e) => e.product == item);

  CartItemEntity cartItemEntity(ProductEntity item) {
    return cartList.firstWhere((e) => e.product == item);
  }

  void removeItem(CartItemEntity item) =>
      cartList.remove(cartItemEntity(item.product));

  double calculateTotalPrice() =>
      cartList.fold(0, (p, e) => p + e.calculateTotalPrice());
}
