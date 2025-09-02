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
              // Only validate going forward, allow going back freely
              if (index > currentPageIndex) {
                // Check if required data exists for next step
                if (!canMoveToStep(index, context.read<OrderEntity>())) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(getValidationMessage(index))),
                  );
                  return;
                }
              }

              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
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

  bool canMoveToStep(int step, OrderEntity order) {
    switch (step) {
      case 1: // Address step
        return order.shippingAddress != null;
      case 2: // Payment step
        return order.shippingAddress
            .isValid(); // Assuming you have an isValid method
      default:
        return true;
    }
  }

  String getValidationMessage(int step) {
    switch (step) {
      case 1:
        return 'يرجى تحديد طريقة الشحن';
      case 2:
        return 'يرجى إكمال بيانات العنوان';
      default:
        return 'يرجى إكمال الخطوة السابقة';
    }
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع'];
  }
}
