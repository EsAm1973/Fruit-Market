import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_item_entity.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20cubit/cart_cubit.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20item%20cubit/cart_item_cubit.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.cartEntity});
  final CartItemEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartEntity) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 80,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cartEntity.product.imageUrl!),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartEntity.product.productName,
                          style: AppTextStyles.bold13,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartEntity,
                            );
                          },
                          child: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${cartEntity.calculateTotalWeight()} كم',
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartEntity.increaseCount();
                            context.read<CartItemCubit>().updateCartItem(
                              cartEntity,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF1B5E37) /* Green1-500 */,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          ' ${cartEntity.quantity}',
                          style: AppTextStyles.bold16,
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            cartEntity.decreaseCount();
                            context.read<CartItemCubit>().updateCartItem(
                              cartEntity,
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF3F5F7),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFF1F1F5),
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Icon(Icons.remove, color: Colors.grey),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${cartEntity.calculateTotalPrice()} جنيه',
                          style: AppTextStyles.bold16.copyWith(
                            color: const Color(0xFFF4A91F),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
