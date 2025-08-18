import 'package:flutter/material.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextFormFeild(
            hintText: 'الأسم بالكامل',
            onSaved: (value) {},
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: 'البريد الإلكتروني',
            onSaved: (value) {},
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: 'العنوان',
            onSaved: (value) {},
            keyboardType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: 'رقم الجوال',
            onSaved: (value) {},
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          CustomTextFormFeild(
            hintText: 'رقم الطابق.رقم الشقة',
            onSaved: (value) {},
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
