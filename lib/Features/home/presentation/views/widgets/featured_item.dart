import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: screenWidth * .4,
              child: Image.asset(Assets.imagesWatermelonTest, fit: BoxFit.fill),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 24),
              width: screenWidth * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Svg(Assets.imagesFeaturedShapeBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عروض العيد',
                    style: AppTextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'خصم 25%',
                    style: AppTextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  FeaturedItemButton(onpressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
