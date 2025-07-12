import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/services/getit_service.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit_market/Features/auth/presentation/manager/login%20cubit/login_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/manager/signup%20cubit/signup_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/views/login_view.dart';
import 'package:fruit_market/Features/auth/presentation/views/signup_view.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_market/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kRegisterRoute = '/register';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnboardingRoute,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(getIt<AuthRepo>()),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: kRegisterRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignupCubit(getIt<AuthRepo>()),
              child: const SignupView(),
            ),
      ),
    ],
  );
}
