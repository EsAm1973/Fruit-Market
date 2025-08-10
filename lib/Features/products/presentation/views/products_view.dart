import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/products/presentation/views/widgets/products_view_body.dart';
import 'package:svg_flutter/svg.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'المنتجات',
              style: AppTextStyles.bold19.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
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
          ),
        ),
      ),
      body: const SafeArea(child: ProductsViewBody()),
    );
  }
}
