import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesUserImage),
      title: Text(
        ' صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        'محمد عبد الحميد',
        style: AppTextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D)),
      ),
      trailing: Container(
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEF8ED) /* green-50 */,
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(
          Assets.imagesNotification,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
