import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/helper_functions/build_error_bar.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_text_styles.dart';
import 'package:fruit_market/Core/utils/assets.dart';
import 'package:fruit_market/Core/widgets/custom_buttom.dart';
import 'package:fruit_market/Core/widgets/custom_text_feild.dart';
import 'package:fruit_market/Core/widgets/password_feild.dart';
import 'package:fruit_market/Features/auth/presentation/manager/login%20cubit/login_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/login_dont_have_account.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/login_social_buttom.dart';
import 'package:fruit_market/Features/auth/presentation/views/widgets/or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          buildErrorBar(context, state.message);
        } else if (state is LoginSuccess) {
          print('///////////// login success //////////////');
          //GoRouter.of(context).pushReplacement(AppRouter.kHomeRoute);
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
                    onSaved: (value) => email = value!,
                    hintText: 'البريد الإلكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  PasswordFeild(onSaved: (value) => password = value!),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.end,
                      'نسيت كلمة المرور؟',
                      style: AppTextStyles.semibold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 33),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButtom(
                        onpressed: () {
                          if (formKey.currentState!.validate()) {
                            autovalidateMode = AutovalidateMode.disabled;
                            formKey.currentState!.save();
                            context
                                .read<LoginCubit>()
                                .signInWithEmailAndPassword(
                                  email: email,
                                  password: password,
                                );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                        text: 'تسجيل دخول',
                      );
                    },
                  ),
                  const SizedBox(height: 33),
                  const DontHaveAccount(),
                  const SizedBox(height: 33),
                  const OrDivider(),
                  SizedBox(height: 16),
                  LoginSocialButtom(
                    title: 'جوجل',
                    image: Assets.imagesGoogleIcon,
                    onpressed: () {
                      context.read<LoginCubit>().signInWithGoogle();
                    },
                  ),
                  const SizedBox(height: 16),
                  LoginSocialButtom(
                    title: 'أبل',
                    image: Assets.imagesAppleIcon,
                    onpressed: () {},
                  ),
                  const SizedBox(height: 16),
                  LoginSocialButtom(
                    title: 'فيسبوك',
                    image: Assets.imagesFacebookIcon,
                    onpressed: () {
                      context.read<LoginCubit>().signInWithFacebook();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
