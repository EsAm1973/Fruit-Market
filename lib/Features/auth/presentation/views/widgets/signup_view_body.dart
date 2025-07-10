import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/helper_functions/build_error_bar.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';
import 'package:fruit_market/Core/widgets/password_feild.dart';
import 'package:fruit_market/Features/auth/presentation/manager/signup%20cubit/signup_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/signup_to_login.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:go_router/go_router.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  late bool termsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupError) {
          buildErrorBar(context, state.message);
        }
        if (state is SignupSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginRoute);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormFeild(
                    onSaved: (value) => name = value!,
                    hintText: 'الأسم بالكامل',
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormFeild(
                    onSaved: (value) => email = value!,
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  PasswordFeild(onSaved: (value) => password = value!),
                  SizedBox(height: 16),
                  TermsCheckbox(
                    onChecked: (value) {
                      setState(() {
                        termsAccepted = value;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  BlocBuilder<SignupCubit, SignupState>(
                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButtom(
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            autovalidateMode = AutovalidateMode.disabled;
                            formKey.currentState!.save();
                            if (termsAccepted) {
                              context
                                  .read<SignupCubit>()
                                  .createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                    name: name,
                                  );
                            } else {
                              buildErrorBar(
                                context,
                                'يجب الموافقة على الشروط والاحكام',
                              );
                            }
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        text: 'إنشاء حساب جديد',
                      );
                    },
                  ),
                  SizedBox(height: 38),
                  SignupToLogin(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
