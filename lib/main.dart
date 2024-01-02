import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Screen_Pages/splash_Screen.dart';
import 'package:pair_me/cubits/Buisness_profile.dart';
import 'package:pair_me/cubits/City&state.dart';
import 'package:pair_me/cubits/Describe_yourself_cubit.dart';
import 'package:pair_me/cubits/ReSend_Otp_cubit.dart';
import 'package:pair_me/cubits/Reset_Password.dart';
import 'package:pair_me/cubits/Verify.dart';
import 'package:pair_me/cubits/adsress_drtails.dart';
import 'package:pair_me/cubits/business_address_cubit.dart';
import 'package:pair_me/cubits/connect_with_cubit.dart';
import 'package:pair_me/cubits/forggot_password.dart';
import 'package:pair_me/cubits/login_cubit.dart';
import 'package:pair_me/cubits/professional_details_cubit.dart';
import 'package:pair_me/cubits/signup.dart';
import 'package:pair_me/cubits/user_profile_cubit.dart';
import 'package:pair_me/cubits/verify_forgot_otp.dart';
import 'package:pair_me/helper/App_Colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((_) async {
    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => VerifyCubit()),
        BlocProvider(create: (context) => CityStateCubit()),
        BlocProvider(create: (context) => AdressDetailsCubit()),
        BlocProvider(create: (context) => ProfessionalDetailsCubit()),
        BlocProvider(create: (context) => BusinessDetailsCubit()),
        BlocProvider(create: (context) => ConnectwithCubit()),
        BlocProvider(create: (context) => DescribeYourSelfCubit()),
        BlocProvider(create: (context) => UserDetailsCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => BusinessProfileCubit()),
        BlocProvider(create: (context) => ForgotPasswordCubit()),
        BlocProvider(create: (context) => ResendOtpCubit()),
        BlocProvider(create: (context) => VerifyForgotOtpCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.skyBlue),
          useMaterial3: true,
        ),
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
          Locale('hi'),
          Locale('can'),
          Locale('man'),
        ],
        localizationsDelegates: context.localizationDelegates,
        home: const SpleshScreen(),
      ),
    );
  }
}
