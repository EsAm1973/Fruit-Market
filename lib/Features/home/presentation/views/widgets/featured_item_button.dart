import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onpressed});
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: FittedBox(child: Text('تسوق الان', style: AppTextStyles.bold13)),
    );
  }
}
