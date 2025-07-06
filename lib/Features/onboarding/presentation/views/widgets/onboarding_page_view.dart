import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/widgets/onboading_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.imagesPageviewImage1,
          backgroundImage: Assets.imagesPageviewBackground1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في', style: AppTextStyles.bold23),
              Text(
                ' HUB',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                'Fruit',
                style: AppTextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.imagesPageviewImage2,
          backgroundImage: Assets.imagesPageviewBackground2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('ابحث وتسوق', style: AppTextStyles.bold23)],
          ),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
