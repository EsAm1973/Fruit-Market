import 'package:flutter/material.dart';
import 'package:fruit_market/Core/services/shared_prefrences_sengelton.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });
  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Prefs.setBool(isOnboadingViewSeenKey, true);
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kLoginRoute);
                    },
                    child: Text(
                      'تخط',
                      style: AppTextStyles.regular13.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            textAlign: TextAlign.center,
            subtitle,
            style: AppTextStyles.semibold13.copyWith(color: Color(0xFF4E5556)),
          ),
        ),
      ],
    );
  }
}
