import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/all_bestsell_products/presentation/views/widgets/all_bestsell_products_view_body.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class AllBestSellProductsView extends StatelessWidget {
  const AllBestSellProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'الاكثر مبيعا',
          style: AppTextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: const ShapeDecoration(
                color: Color(0xFFEEF8ED) /* green-50 */,
                shape: OvalBorder(),
              ),
              child: SvgPicture.asset(
                Assets.imagesNotification,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const SafeArea(child: AllBestSellProductsViewBody()),
    );
  }
}
