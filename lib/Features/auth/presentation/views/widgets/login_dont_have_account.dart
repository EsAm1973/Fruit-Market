import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key, required this.onpressed});
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'لا تمتلك حساب؟',
              style: AppTextStyles.semibold16.copyWith(
                color: Color(0xFF949D9E),
                height: 1.40,
              ),
            ),
            TextSpan(
              text: ' ',
              style: AppTextStyles.semibold16.copyWith(
                color: Color(0xFF949D9E),
                height: 1.40,
              ),
            ),
            TextSpan(
              text: 'قم بأنشاء حساب',
              style: AppTextStyles.semibold16.copyWith(
                color: AppColors.primaryColor,
                height: 1.40,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
