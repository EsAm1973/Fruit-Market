import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/helper_functions/build_error_bar.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20cubit/cart_cubit.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20item%20cubit/cart_item_cubit.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_header.dart';
import 'package:fruit_market/Features/cart/presentation/views/widgets/cart_list.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartHeader(),
        CartList(cartList: context.watch<CartCubit>().cartEntity.cartList),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CartItemCubit, CartItemState>(
            builder: (context, state) {
              return CustomButtom(
                onpressed: () {
                  if (context.read<CartCubit>().cartEntity.cartList.isEmpty) {
                    buildErrorBar(context, 'السلة فارغة');
                  } else {
                    GoRouter.of(context).push(
                      AppRouter.kCheckoutRoute,
                      extra: context.read<CartCubit>().cartEntity,
                    );
                  }
                },
                text:
                    'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
              );
            },
          ),
        ),
      ],
    );
  }
}
