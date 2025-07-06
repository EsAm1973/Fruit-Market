import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/widgets/onboading_page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageviewImage1,
          backgroundImage: Assets.imagesPageviewBackground1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('مرحبًا بك في'), Text('Fruit'), Text('HUB')],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
        ),
        PageViewItem(
          image: Assets.imagesPageviewImage2,
          backgroundImage: Assets.imagesPageviewBackground2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('ابحث وتسوق')],
          ),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        ),
      ],
    );
  }
}
