import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pair_me/Screen_Pages/splash_Screen.dart';
import 'package:pair_me/helper/App_Colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_) async {
    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('sp'),
          Locale('hi'),
          Locale('can'),
          Locale('man'),
        ],
        fallbackLocale: const Locale('en'),
        path: 'assets/Language',
        child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.skyBlue),
        useMaterial3: true,
      ),
      supportedLocales: const [
        Locale('en'),
        Locale('sp'),
        Locale('hi'),
        Locale('can'),
        Locale('man'),
      ],
      localizationsDelegates: context.localizationDelegates,
      home: const SpleshScreen(),
    );
  }
}
