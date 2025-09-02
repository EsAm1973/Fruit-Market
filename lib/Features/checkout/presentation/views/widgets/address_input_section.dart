import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';
import 'package:fruit_market/Features/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder:
            (context, value, child) => Form(
              key: formKey,
              autovalidateMode: value,
              child: Column(
                children: [
                  CustomTextFormFeild(
                    hintText: 'الأسم بالكامل',
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress.name = value!;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    hintText: 'البريد الإلكتروني',
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress.email =
                          value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    hintText: 'العنوان',
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress.address =
                          value!;
                    },
                    keyboardType: TextInputType.streetAddress,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    hintText: 'رقم الجوال',
                    onSaved: (value) {
                      context.read<OrderEntity>().shippingAddress.phone =
                          value!;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormFeild(
                    hintText: 'رقم الطابق.رقم الشقة',
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .shippingAddress
                          .addressDescription = value!;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
