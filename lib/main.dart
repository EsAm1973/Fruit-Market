import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_market/Core/services/custom_bloc_observer.dart';
import 'package:fruit_market/Core/services/getit_service.dart';
import 'package:fruit_market/Core/services/shared_prefrences_sengelton.dart';
import 'package:fruit_market/Core/utils/app_colors.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/firebase_options.dart';
import 'package:fruit_market/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupGetIt();
  runApp(const FruitMarket());
}

class FruitMarket extends StatelessWidget {
  const FruitMarket({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar', 'AE'),
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
    );
  }
}
