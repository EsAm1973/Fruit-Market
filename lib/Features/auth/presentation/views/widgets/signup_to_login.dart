import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class SignupToLogin extends StatelessWidget {
  const SignupToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: AppTextStyles.semibold16.copyWith(
              color: const Color(0xFF949D9E),
              height: 1.40,
            ),
          ),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () => context.push(AppRouter.kLoginRoute),
            text: 'تسجيل دخول',
            style: AppTextStyles.semibold16.copyWith(
              color: AppColors.primaryColor,
              height: 1.40,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
