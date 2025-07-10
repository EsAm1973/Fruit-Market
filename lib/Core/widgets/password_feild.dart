import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      obscureText: isObscure,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.name,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        child:
            isObscure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
      ),
    );
  }
}
