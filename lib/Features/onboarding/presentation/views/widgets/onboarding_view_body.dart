import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Core/services/shared_prefrences_sengelton.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:fruit_market/constants.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageView(pageController: pageController)),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color:
                currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.5),
            size: const Size(13, 13),
            activeSize: const Size(13, 13),
            // activeShape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            // ),
          ),
        ),
        SizedBox(height: 30),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButtom(
              onpressed: () {
                Prefs.setBool(isOnboadingViewSeenKey, true);
                GoRouter.of(context).pushReplacement(AppRouter.kLoginRoute);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
