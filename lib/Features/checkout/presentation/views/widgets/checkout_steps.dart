import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('يرجي تحديد طريقه الدفع'),
                  ),
                );
              }
            },
            child: StepItem(
              text: getSteps()[index],
              index: (index + 1).toString(),
              isActive: index <= currentPageIndex,
            ),
          ),
        );
      }),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع'];
  }
}
