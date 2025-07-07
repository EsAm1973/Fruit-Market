import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({super.key});

  @override
  _TermsCheckboxState createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool _agreed = false;

  // void _onLinkTap() {
  //   // هنا ضع المنطق عند الضغط على "الشروط والأحكام الخاصة بنا"
  //   // مثلاً التنقل لشاشة الشروط:
  //   // Navigator.pushNamed(context, '/terms');
  //   print('تم الضغط على الشروط والأحكام');
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: BorderSide(color: const Color(0xFFE6E9E9), width: 1.50),
            value: _agreed,
            onChanged: (value) {
              setState(() {
                _agreed = value ?? false;
              });
            },
          ),
        ),
        // لجعل النص يلتف تلقائياً ضمن المساحة المتاحة
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.semibold13.copyWith(
                    color: const Color(0xFF616A6B),
                    height: 1.70,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.semibold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                    /* Green1-600 */
                    height: 1.70,
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.semibold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                    /* Green1-600 */
                    height: 1.70,
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.semibold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                    /* Green1-600 */
                    height: 1.70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
