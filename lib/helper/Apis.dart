class apis{
  static const String baseurl = "http://192.168.29.116:3334";



  //Sign up
  static const String Login = "${baseurl}/login";
  static const String signUp = "${baseurl}/signup";
  static const String verify = "${baseurl}/verify";
  static const String Address = "${baseurl}/address_details";
  static const String business_profile = "${baseurl}/profile";
  static const String professional_details = "${baseurl}/professional_details";
  static const String business_address = "${baseurl}/business_address";
  static const String describe_yourself = "${baseurl}/describe_yourself";
  static const String describe_connect_with = "${baseurl}/describe_connect_with";
  static const String forgotpassword = "${baseurl}/forgotpassword";
  static const String verify_forgot_otp = "${baseurl}/verify_forgot_otp";
  static const String reset_password = "${baseurl}/reset_password";
  static const String resendOtp = "${baseurl}/resendOtp";



  static const String UserProfile = "${baseurl}/user_profile";
  static const String showAllProfiles = "${baseurl}/showAllProfiles";


  // App Manage
  static const String change_password = "${baseurl}/change_password";
  static const String delete_user = "${baseurl}/delete_user";
  static const String logout = "${baseurl}/logout";
  static const String filter = "${baseurl}/filter";


  //city and state
  static const String city = "${baseurl}/find_city";
  static const String state = "${baseurl}/find_state";

  // update
  static const String userupdate = "${baseurl}/user_update";
  static const String address_update = "${baseurl}/address_update";
  static const String business_address_update = "${baseurl}/business_address_update";
  static const String professional_details_update = "${baseurl}/professional_details_update";
  static const String profile_update = "${baseurl}/profile_update";

  //Payment
  static const String payment = "http://192.168.29.204:3334/checkout";
}