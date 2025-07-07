import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xFFDCDEDE))),
        SizedBox(width: 18,),
        Text(
          'أو',
          style: AppTextStyles.semibold16.copyWith(
            color: Color(0xFF0C0D0D),
            height: 1.40,
          ),
        ),
        SizedBox(width: 18,),
        Expanded(child: Divider(color: const Color(0xFFDCDEDE))),
      ],
    );
  }
}
