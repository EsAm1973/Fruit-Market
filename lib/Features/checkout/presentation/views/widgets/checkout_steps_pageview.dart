import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(formKey: formKey, valueListenable: valueListenable),
       PaymentSection(
        pageController: pageController,
      ),
    ];
  }
}
