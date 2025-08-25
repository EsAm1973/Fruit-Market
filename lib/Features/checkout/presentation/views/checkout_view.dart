import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_entity.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('الشحن', style: AppTextStyles.bold19),
      ),
      body: SafeArea(
        child: Provider.value(
          value: OrderEntity(cartEntity: cartEntity),
          child: const CheckoutViewBody(),
        ),
      ),
    );
  }
}
