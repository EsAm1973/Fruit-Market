import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

AppBar buildAppBar({required BuildContext context, required String title}) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: AppTextStyles.bold19),
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }