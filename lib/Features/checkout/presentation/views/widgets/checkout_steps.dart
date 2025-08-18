import 'package:flutter/material.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            text: getSteps()[index],
            index: (index + 1).toString(),
            isActive: false,
          ),
        );
      }),
    );
  }

  List<String> getSteps() {
    return ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
  }
}
