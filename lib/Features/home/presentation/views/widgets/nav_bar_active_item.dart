import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.iconPath, required this.name});
  final String iconPath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor /* Green1-500 */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(iconPath)),
            ),
            SizedBox(width: 4),
            Text(
              name,
              style: AppTextStyles.semibold11.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
