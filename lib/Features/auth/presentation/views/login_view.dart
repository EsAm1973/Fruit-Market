import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_app_bar.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context, title: 'تسجيل الدخول'),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
