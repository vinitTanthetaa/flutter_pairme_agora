import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pair_me/Screen_Pages/splash_Screen.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/App_Language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.skyBlue),
        useMaterial3: true,
      ),
      locale: Locale('en'),
      localizationsDelegates: const [
      //  AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'),
        Locale('hi'),
        Locale('can'),
        Locale('man'),
      ],
      home: const SpleshScreen(),
    );
  }
}

