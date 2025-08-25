import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/checkout_steps_pageview.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CheckoutSteps(),
          Expanded(
            child: CheckOutStepsPageView(pageController: pageController),
          ),
          CustomButtom(
            onpressed: () {
              pageController.animateToPage(
                2,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            text: 'التالى',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
