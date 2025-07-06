import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(activeColor: AppColors.primaryColor),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButtom(onpressed: () {}, text: 'ابدأ الان'),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
