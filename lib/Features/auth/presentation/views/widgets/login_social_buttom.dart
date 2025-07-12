import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg_flutter.dart';

class LoginSocialButtom extends StatelessWidget {
  const LoginSocialButtom({
    super.key,
    required this.title,
    required this.image,
    required this.onpressed,
  });
  final String title;
  final String image;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color(0xFFDCDEDE), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.white,
      ),
      child: ListTile(
        leading: SvgPicture.asset(image,width: 25,height: 25,),
        title: Text(
          textAlign: TextAlign.center,
          'تسجيل دخول باستخدام $title',
          style: AppTextStyles.semibold16.copyWith(
            color: const Color(0xFF0C0D0D),
            height: 1.40,
          ),
        ),
      ),
    );
  }
}
