import 'package:flutter/material.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/confirm_request_payment_section.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/request_summary_payment_section.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RequestSummaryPaymentSection(),
        const SizedBox(height: 30),
        ConfirmRequestPaymentSection(pageController: pageController),
      ],
    );
  }
}
