import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Screen_Pages/splash_Screen.dart';
import 'package:pair_me/cubits/Buisness_profile.dart';
import 'package:pair_me/cubits/City&state.dart';
import 'package:pair_me/cubits/Delete_logout_user.dart';
import 'package:pair_me/cubits/Describe_yourself_cubit.dart';
import 'package:pair_me/cubits/Filter_user.dart';
import 'package:pair_me/cubits/Professional_details_update.dart';
import 'package:pair_me/cubits/ReSend_Otp_cubit.dart';
import 'package:pair_me/cubits/Reset_Password.dart';
import 'package:pair_me/cubits/Verify.dart';
import 'package:pair_me/cubits/acceptORrejectnotification.dart';
import 'package:pair_me/cubits/address_update.dart';
import 'package:pair_me/cubits/adsress_drtails.dart';
import 'package:pair_me/cubits/business_add_update.dart';
import 'package:pair_me/cubits/business_address_cubit.dart';
import 'package:pair_me/cubits/change_password.dart';
import 'package:pair_me/cubits/clearAllNotification_cubit.dart';
import 'package:pair_me/cubits/connect_user.dart';
import 'package:pair_me/cubits/connect_with_cubit.dart';
import 'package:pair_me/cubits/connected_user_data.dart';
import 'package:pair_me/cubits/forggot_password.dart';
import 'package:pair_me/cubits/login_cubit.dart';
import 'package:pair_me/cubits/message_data_cubit.dart';
import 'package:pair_me/cubits/message_user.dart';
import 'package:pair_me/cubits/notification_cubit.dart';
import 'package:pair_me/cubits/professional_details_cubit.dart';
import 'package:pair_me/cubits/profile_update.dart';
import 'package:pair_me/cubits/reject_user.dart';
import 'package:pair_me/cubits/remove_connect_user.dart';
import 'package:pair_me/cubits/show_all_users.dart';
import 'package:pair_me/cubits/signup.dart';
import 'package:pair_me/cubits/undo_users_cubit.dart';
import 'package:pair_me/cubits/user_profile_cubit.dart';
import 'package:pair_me/cubits/user_update_cubit.dart';
import 'package:pair_me/cubits/verify_forgot_otp.dart';
import 'package:pair_me/helper/App_Colors.dart';

import 'Screen_Pages/Step_Screens.dart';
import 'Screen_Pages/connections_page.dart';
import 'Screen_Pages/invitation_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en'), // English
          Locale('hi'), // Hindi
          Locale('es'), // Spanish
          Locale('zh', 'CN'), // Simplified Chinese mandarin
          Locale('zh', 'TW'), // Traditional Chinese cantesos
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
        BlocProvider(create: (context) => AddressDetailsCubit()),
        BlocProvider(create: (context) => BusinessaddressUpdatesCubit()),
        BlocProvider(create: (context) => BusinessprofileupdateCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => AllUsersDetailsCubit()),
        BlocProvider(create: (context) => RejectUserCubit()),
        BlocProvider(create: (context) => ConnectUserCubit()),
        BlocProvider(create: (context) => FilterUserCubit()),
        BlocProvider(create: (context) => DeleteUserCubit()),
        BlocProvider(create: (context) => LogoutUserCubit()),
        BlocProvider(create: (context) => UserUpdateCubit()),
        BlocProvider(create: (context) => UndoUsersCubit()),
        BlocProvider(create: (context) => ProfessionalDetailsUpdateCubit()),
        BlocProvider(create: (context) => NotificationCubit()),
        BlocProvider(create: (context) => MessageCubit()),
        BlocProvider(create: (context) => ClearAllNotificationCubit()),
        BlocProvider(create: (context) => AcceptorRejectCubit()),
        BlocProvider(create: (context) => ConnectedUsersCubit()),
        BlocProvider(create: (context) => RemoveUserCubit()),
        BlocProvider(create: (context) => MessageUserCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.skyBlue),
          useMaterial3: true,
        ),
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: const SpleshScreen(),
      ),
    );
  }
}
