import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/signup_to_login.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormFeild(
              hintText: 'الأسم بالكامل',
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextFormFeild(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.name,
              suffixIcon: Icon(Icons.visibility_off),
            ),
            SizedBox(height: 16),
            TermsCheckbox(),
            SizedBox(height: 30),
            CustomButtom(onpressed: () {}, text: 'إنشاء حساب جديد'),
            SizedBox(height: 38),
            SignupToLogin(),
          ],
        ),
      ),
    );
  }
}
