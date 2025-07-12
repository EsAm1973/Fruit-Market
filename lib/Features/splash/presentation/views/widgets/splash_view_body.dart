import 'package:flutter/material.dart';
import 'package:fruit_market/Core/services/shared_prefrences_sengelton.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    executeNavigation();
  }

  Future<void> executeNavigation() async {
    bool isOnboardingViewed = Prefs.getBool(isOnboadingViewSeenKey);
    if (isOnboardingViewed) {
      await Future.delayed(const Duration(seconds: 3));
      GoRouter.of(context).pushReplacement(AppRouter.kLoginRoute);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      GoRouter.of(context).pushReplacement(AppRouter.kOnboardingRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(Assets.imagesPlantSplash),
        ),
        SvgPicture.asset(Assets.imagesLogoSplash),
        SvgPicture.asset(Assets.imagesBottomSplash, fit: BoxFit.fill),
      ],
    );
  }
}
