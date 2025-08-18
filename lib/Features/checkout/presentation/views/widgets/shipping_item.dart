import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title, subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
          ),
        ),

        // Determine the Widget height
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingDot()
                  : const InActiveShippingDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.semibold13),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.regular13.copyWith(
                      color: Colors.black.withValues(alpha: 0.50),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingDot extends StatelessWidget {
  const InActiveShippingDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFF949D9E))),
      ),
    );
  }
}

class ActiveShippingDot extends StatelessWidget {
  const ActiveShippingDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
