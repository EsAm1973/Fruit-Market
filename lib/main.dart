import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_market/Core/utils/app_router.dart';
import 'package:fruit_market/generated/l10n.dart';

void main() {
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
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Cairo'),
    );
  }
}
