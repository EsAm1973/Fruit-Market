import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/services/getit_service.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit_market/Features/auth/presentation/manager/login%20cubit/login_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/manager/signup%20cubit/signup_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/views/login_view.dart';
import 'package:fruit_market/Features/auth/presentation/views/signup_view.dart';
import 'package:fruit_market/Features/best%20selling%20products/presentation/views/best_selling_view.dart';
import 'package:fruit_market/Features/home/domain/repos/porducts_repo.dart';
import 'package:fruit_market/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruit_market/Features/home/presentation/views/home_view.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_market/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kRegisterRoute = '/register';
  static const String kHomeRoute = '/home';
  static const String kBestSellingRoute = '/best-selling';
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
      GoRoute(
        path: kHomeRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: kBestSellingRoute,
        builder: (context, state) => const BestSellingView(),
      ),
    ],
  );
}
