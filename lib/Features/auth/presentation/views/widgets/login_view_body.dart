import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/login_dont_have_account.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/login_social_buttom.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFeild(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Text(
                textAlign: TextAlign.end,
                'نسيت كلمة المرور؟',
                style: AppTextStyles.semibold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 33),
            CustomButtom(onpressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 33),
            DontHaveAccount(
              onpressed: () {
                //GoRouter.of(context).pushReplacement(AppRouter.kRegisterRoute);
              },
            ),
            const SizedBox(height: 33),
            const OrDivider(),
            SizedBox(height: 16),
            LoginSocialButtom(
              title: 'جوجل',
              image: Assets.imagesGoogleIcon,
              onpressed: () {},
            ),
            const SizedBox(height: 16),
            LoginSocialButtom(
              title: 'أبل',
              image: Assets.imagesAppleIcon,
              onpressed: () {},
            ),
            const SizedBox(height: 16),
            LoginSocialButtom(
              title: 'فيسبوك',
              image: Assets.imagesFacebookIcon,
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
