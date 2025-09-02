import 'package:bloc/bloc.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_entity.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';
import 'package:fruit_market/Features/home/domain/entites/product_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartEntity cartEntity = CartEntity(cartList: []);
  CartCubit() : super(CartInitial());

  void addProductToCart(ProductEntity productEntity) {
    //check if product is exist
    bool isExist = cartEntity.isExist(productEntity);
    if (isExist) {
      //increase quantity
      CartItemEntity cartItemEntity = cartEntity.cartItemEntity(productEntity);
      cartItemEntity.increaseCount();
    } else {
      //add to cart
      CartItemEntity cartItemEntity = CartItemEntity(
        product: productEntity,
        quantity: 1,
      );
      cartEntity.cartList.add(cartItemEntity);
    }

    emit(CartAddedItem());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeItem(cartItemEntity);
    emit(CartRemovedItem());
  }
}
