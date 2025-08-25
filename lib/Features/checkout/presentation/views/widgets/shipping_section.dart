import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} جنيه',
          isSelected: selectedIndex == 0,
          onTap: () {
            selectedIndex = 0;
            setState(() {});
          },
        ),
        const SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price:
              '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40).toString()} جنيه',
          isSelected: selectedIndex == 1,
          onTap: () {
            selectedIndex = 1;
            setState(() {});
          },
        ),
      ],
    );
  }
}
