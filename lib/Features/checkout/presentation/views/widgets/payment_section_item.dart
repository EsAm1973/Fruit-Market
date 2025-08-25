import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class PaymentSectionItem extends StatelessWidget {
  const PaymentSectionItem({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bold13),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}
