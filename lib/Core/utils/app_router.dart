import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Core/services/getit_service.dart';
import 'package:fruit_market/Core/widgets/home_navigation_bar.dart';
import 'package:fruit_market/Features/all_bestsell_products/presentation/views/all_best_selling_view.dart';
import 'package:fruit_market/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit_market/Features/auth/presentation/manager/login%20cubit/login_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/manager/signup%20cubit/signup_cubit.dart';
import 'package:fruit_market/Features/auth/presentation/views/login_view.dart';
import 'package:fruit_market/Features/auth/presentation/views/signup_view.dart';
import 'package:fruit_market/Features/cart/domin/entities/cart_entity.dart';
import 'package:fruit_market/Features/cart/presentation/manager/cart%20cubit/cart_cubit.dart';
import 'package:fruit_market/Features/checkout/domain/repos/orders_repo.dart';
import 'package:fruit_market/Features/checkout/presentation/manager/Add%20Order/add_order_cubit.dart';
import 'package:fruit_market/Features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_market/Features/home/domain/repos/porducts_repo.dart';
import 'package:fruit_market/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:fruit_market/Features/home/presentation/views/home_view.dart';
import 'package:fruit_market/Features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_market/Features/products/presentation/views/products_view.dart';
import 'package:fruit_market/Features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSplashRoute = '/';
  static const String kOnboardingRoute = '/onboarding';
  static const String kLoginRoute = '/login';
  static const String kRegisterRoute = '/register';
  static const String kHomeNavigationBarRoute = '/home_navigation_bar';
  static const String kHomeRoute = '/home';
  static const String kAllProductsRoute = '/all_products';
  static const String kBestSellingRoute = '/best_selling';
  static const String kCheckoutRoute = '/checkout';
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
        path: kHomeNavigationBarRoute,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProductsCubit(getIt<ProductsRepo>()),
                ),
                BlocProvider(create: (context) => CartCubit()),
              ],
              child: const HomeNavigationBar(),
            ),
      ),
      GoRoute(path: kHomeRoute, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kAllProductsRoute,
        builder: (context, state) => const ProductsView(),
      ),
      GoRoute(
        path: kBestSellingRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => ProductsCubit(getIt<ProductsRepo>()),
              child: const AllBestSellProductsView(),
            ),
      ),
      GoRoute(
        path: kCheckoutRoute,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AddOrderCubit(getIt<OrdersRepo>()),
              child: CheckoutView(cartEntity: state.extra as CartEntity),
            ),
      ),
    ],
  );
}
