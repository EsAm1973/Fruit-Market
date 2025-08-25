import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/payment_section_item.dart';

class RequestSummaryPaymentSection extends StatelessWidget {
  const RequestSummaryPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentSectionItem(
      title: 'ملخص الطلب',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المجموع الفرعي :',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF0C0D0D),
                  height: 1.40,
                ),
              ),
              Text(
                '150 جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.semibold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                  height: 1.40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التوصيل :',
                style: AppTextStyles.regular13.copyWith(
                  color: const Color(0xFF0C0D0D),
                  height: 1.40,
                ),
              ),
              Text(
                '30 جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.semibold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                  height: 1.40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(thickness: 0.50, color: Color(0xFFCACECE)),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الكلي', style: AppTextStyles.bold16),
              Text(
                '180 جنيه',
                textAlign: TextAlign.right,
                style: AppTextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
