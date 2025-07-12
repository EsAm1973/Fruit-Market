import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_app_bar.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'حساب جديد'),
      body: SafeArea(child: SignupViewBody()),
    );
  }
}
