import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

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
