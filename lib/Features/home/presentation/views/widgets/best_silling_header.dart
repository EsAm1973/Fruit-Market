import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class BestSillingHeader extends StatelessWidget {
  const BestSillingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        Spacer(),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style: AppTextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
      ],
    );
  }
}
