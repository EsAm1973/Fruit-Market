import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.index, required this.text});
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFF2F3F3),
          radius: 11.5,
          child: Text(index, style: AppTextStyles.semibold13),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.semibold13.copyWith(
            color: const Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
