import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/splash_Screen.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/App_Language.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
     //   Locale('sp'),
        Locale('hi')],
      //  fallbackLocale: const Locale('en'),
      path: 'assets/Language',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // locale: Locale('en'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.skyBlue),
        useMaterial3: true,
      ),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: const SpleshScreen(),
    );
  }
}
