import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/cubits/Reset_Password.dart';
import 'package:pair_me/helper/Size_page.dart';

class Create_New_Password extends StatefulWidget {
  String Phonenumber;
  Create_New_Password({super.key,required this.Phonenumber});

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
  ResetPasswordCubit resetPasswordCubit = ResetPasswordCubit();
  final TextEditingController  _Password = TextEditingController();
  final TextEditingController  _confirmPassword = TextEditingController();
  bool hidePassword = true;
  bool hideconfirmPassword = true;
  RegExp regExp =  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetPasswordCubit = BlocProvider.of<ResetPasswordCubit>(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context,dividedBy: 10),),
                  custom_header(text: "Create New Password"),
                  custom_discription(text: "Your new password cannot be the same as a previous password"),
                  SizedBox(height: screenHeight(context,dividedBy: 50),),
                  custom_textfield_header(text: 'Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  }, image: hidePassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png', hint: 'Enter your password', controller: _Password, hidetext: hidePassword, readOnly: false),
                  custom_textfield_header(text: 'Confirm Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hideconfirmPassword = !hideconfirmPassword;
                    });
                  },  hint: 'Enter your Confirm password', image: hideconfirmPassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png',controller: _confirmPassword, hidetext: hideconfirmPassword, readOnly: false),
                  const Spacer(),
                  BlocBuilder<ResetPasswordCubit,ResetPasswordState>(builder: (context, state) {
                    if(state is ResetPasswordLoading){
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 20)),
                          child: customLoader());
                          }
                    return Custom_botton(context, text: 'Save', onTap: () {
                      if(_Password.text.isEmpty){
                        flutterToast("Enter your new password", false);
                      }else if(regExp.hasMatch(_Password.text)){
                        if (_confirmPassword.text.isEmpty){
                          flutterToast("Please Enter Your Confirm Password", false);
                        }else if (_confirmPassword.text != _Password.text){
                          flutterToast("Please Enter Password And Confirm Password are same", false);
                        }else {
                          resetPasswordCubit.ResetPasswordService(phoneNumber: widget.Phonenumber, password: _Password.text, confirmPassword: _confirmPassword.text, context: context);
                        }
                      }else {
                        flutterToast("please enter at lest 1 upper case and 1 lower case and 1 digit and 1 special carecter and at least 8 characters", false);

                      }
                    }, height: screenHeight(context,dividedBy: 20),);
                  },)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
