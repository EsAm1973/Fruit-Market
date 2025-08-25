import 'package:flutter/material.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Features/checkout/presentation/views/widgets/payment_section_item.dart';
import 'package:svg_flutter/svg.dart';

class ConfirmRequestPaymentSection extends StatelessWidget {
  const ConfirmRequestPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentSectionItem(
      title: 'يرجى تأكيد الطلب',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('وسيلة الدفع', style: AppTextStyles.bold13),
              Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'تعديل',
                    style: AppTextStyles.bold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textDirection: TextDirection.ltr,
                '**** **** **** 6522',
                style: AppTextStyles.regular16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const SizedBox(width: 30),
              SvgPicture.asset(Assets.imagesVisaIcon, width: 50, height: 50),
            ],
          ),
          const SizedBox(height: 13),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('عنوان التوصيل', style: AppTextStyles.bold13),
                  Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: Color(0xFF949D9E) /* Grayscale-400 */,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        'تعديل',
                        style: AppTextStyles.bold13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'شارع النيل، مبنى رقم ١٢٣',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.regular16.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
