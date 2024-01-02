import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pair_me/Modal/city&state.dart';
import 'package:pair_me/Screen_Pages/business_profile.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/cubits/City&state.dart';
import 'package:pair_me/cubits/business_add_update.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Business_Address extends StatefulWidget {
  Business_Address({super.key});

  @override
  State<Business_Address> createState() => _Business_AddressState();
}

class _Business_AddressState extends State<Business_Address> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  bool _contry = false;
  bool _state = false;
  bool _city = false;
  bool calendar = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  BusinessaddressUpdatesCubit businessaddressUpdatesCubit = BusinessaddressUpdatesCubit();
  CityStateCubit cityStateCubit = CityStateCubit();
  CityandState cityandState = CityandState();
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _Address2 = TextEditingController();
  final TextEditingController _Zipcode = TextEditingController();
  final TextEditingController _Contry = TextEditingController();
  final TextEditingController _State = TextEditingController();
  final TextEditingController _City = TextEditingController();
  final TextEditingController _date = TextEditingController();
  GetData(String country) async {
    cityandState = (await cityStateCubit.getcalendarEvents(country: country))!;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left:8),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                title: custom_header(text: "Business or Professional Address"),
              ),
              body: SingleChildScrollView(
                physics:ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_discription(text: "Your new password cannot be the same as a previous password."),
                      SizedBox(height: screenHeight(context,dividedBy: 50),),
                      custom_textfield_header(text: 'Address'),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 1",mxline: 2, hidetext: false, controller: _Address),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 2",mxline: 2, hidetext: false, controller: _Address2),
                      custom_textfield_header(text: 'Country'),
                      Custom_textfield(context,
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                print(
                                    'Select country: ${country.phoneCode}');
                                print('Select country: ${country.name}');
                                _Contry.text = country.name;
                                GetData(_Contry.text);
                                // countryCodeSelect = country.phoneCode;
                                // countryCodeflagsvg = country.flagEmoji;
                                //flutterToast(country.displayNameNoCountryCode, true);
                                setState(() {});
                              },
                            );
                          },
                          show_icon: true,
                          image: _contry
                              ? 'assets/Images/Vector.png'
                              : 'assets/Images/right_arrow.png',
                          readOnly: true,
                          onPress: () {
                            // setState(() {
                            //   _contry = !_contry;
                            // });
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                print(
                                    'Select country: ${country.phoneCode}');
                                print('Select country: ${country.name}');
                                _Contry.text = country.name;
                                GetData(_Contry.text);
                                // countryCodeSelect = country.phoneCode;
                                // countryCodeflagsvg = country.flagEmoji;
                                //flutterToast(country.displayNameNoCountryCode, true);
                                setState(() {});
                              },
                            );
                          },
                          hint: "Select",
                          hidetext: false,
                          controller: _Contry),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'State'),
                                Custom_textfield(context,
                                    onTap: () {
                                      setState(() {
                                        _state = !_state;
                                      });
                                    },
                                    show_icon: true,
                                    image: _state
                                        ? 'assets/Images/Vector.png'
                                        : 'assets/Images/right_arrow.png',
                                    readOnly: true,
                                    onPress: () {
                                      setState(() {
                                        _state = !_state;
                                      });
                                    },
                                    hint: "Select",
                                    hidetext: false,
                                    controller: _State),
                                _state
                                    ? Container(
                                    height: screenHeight(context,
                                        dividedBy: 7),
                                    width: screenWidth(context),
                                    margin: const EdgeInsets.only(
                                        bottom: 10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(7),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(
                                              1,
                                              1,
                                            ),
                                            blurRadius: 4,
                                            // spreadRadius: 1.0,
                                          ),
                                        ]),
                                    child: BlocBuilder<CityStateCubit,
                                        CityStateState>(
                                      builder: (context, state) {
                                        print(state);
                                        if (state is CityStateError)
                                          return Center(
                                            child: Text("No State"),
                                          );
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: screenHeight(
                                                  context,
                                                  dividedBy: 100),
                                              horizontal: screenWidth(
                                                  context,
                                                  dividedBy: 30)),
                                          child: ListView.builder(
                                            physics:
                                            const ClampingScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemCount: cityandState
                                                .state?.states.length,
                                            itemBuilder:
                                                (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  _State.text = cityandState
                                                      .state
                                                      ?.states[
                                                  index]
                                                      .name ??
                                                      '';
                                                  _state = !_state;
                                                  setState(() {

                                                  });
                                                },
                                                child: custom_text(
                                                    text: cityandState
                                                        .state
                                                        ?.states[
                                                    index]
                                                        .name ??
                                                        '',
                                                    color: const Color(
                                                        0xff303030)),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ))
                                    : SizedBox(
                                  height: _city
                                      ? screenHeight(context,
                                      dividedBy: 6.35)
                                      : 0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context, dividedBy: 50),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'City'),
                                Custom_textfield(
                                    onTap: () {
                                      setState(() {
                                        _city = !_city;
                                      });
                                    },
                                    context,
                                    show_icon: true,
                                    image: _city
                                        ? 'assets/Images/Vector.png'
                                        : 'assets/Images/right_arrow.png',
                                    readOnly: true,
                                    onPress: () {
                                      setState(() {
                                        _city = !_city;
                                      });
                                    },
                                    hint: "Select",
                                    hidetext: false,
                                    controller: _City),
                                _city
                                    ? Container(
                                  margin: const EdgeInsets.only(
                                      bottom: 10),
                                  height: screenHeight(context,
                                      dividedBy: 7),
                                  width: screenWidth(context),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            1,
                                            1,
                                          ),
                                          blurRadius: 4,
                                          // spreadRadius: 1.0,
                                        ),
                                      ]),
                                  child: BlocBuilder<CityStateCubit,
                                      CityStateState>(
                                    builder: (context, state) {
                                      print(state);
                                      if (state is CityStateError)
                                        return Center(
                                          child: Text("No State"),
                                        );
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: screenHeight(
                                                context,
                                                dividedBy: 100),
                                            horizontal: screenWidth(
                                                context,
                                                dividedBy: 30)),
                                        child: ListView.builder(
                                          physics:
                                          const ClampingScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemCount: cityandState
                                              .city?.cities.length,
                                          itemBuilder:
                                              (context, index) {
                                            return InkWell(
                                                onTap: () {
                                                  _City.text = cityandState
                                                      .city
                                                      ?.cities[
                                                  index] ??
                                                      '';
                                                  _city = !_city;
                                                  setState(() {});
                                                },
                                                child: custom_text(
                                                    text: cityandState
                                                        .city
                                                        ?.cities[
                                                    index] ??
                                                        '',
                                                    color: const Color(
                                                        0xff303030)));
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                )
                                    : SizedBox(
                                  height: _state
                                      ? screenHeight(context,
                                      dividedBy: 6.35)
                                      : 0,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      custom_textfield_header(text: 'Post code / Zip code'),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Post code / Zip code",number: true, hidetext: false, controller: _Zipcode),
                      custom_textfield_header(text: 'Start Date'),
                      Custom_textfield(context,onTap: () {
                        setState(() {
                          calendar = !calendar;
                        });
                      }, show_icon: true, image: 'assets/Images/calendar.png',onPress: () {
                        BottomPicker.date(
                          title: 'Set your Birthday',
                          dateOrder: DatePickerDateOrder.dmy,
                          initialDateTime: _focusedDay,
                          gradientColors: [AppColor.skyBlue,AppColor.whiteskyBlue],
                          titlePadding: EdgeInsets.only(top: screenHeight(context,dividedBy: 100)),
                          height: screenHeight(context,dividedBy: 3),
                          dismissable: true,
                          displayCloseIcon: false,
                          maxDateTime: DateTime(2050),
                          minDateTime: DateTime(1980),
                          pickerTextStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          titleStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.black),
                          titleAlignment: CrossAxisAlignment.center,
                          onChange: (index) {

                          },
                          onSubmit: (index) {
                            _date.text = DateFormat('dd MMMM yyyy').format(index);
                          },
                          bottomPickerTheme: BottomPickerTheme.plumPlate,
                        ).show(context);
                      }, hint: 'Select ', controller: _date, hidetext: false,readOnly: true),
                      Custom_botton(context, text:'SAVE', onTap: () {
                        businessaddressUpdatesCubit.BusinessaddressUpdatesService(address: "${_Address.text} ${_Address2.text}", country: _Contry.text, state: _State.text, city: _City.text, zipCode: _Zipcode.text, start_date: _date.text, context: context);
                        //  Navigator.pop(context);
                      }, height: screenHeight(context,dividedBy: 20),)
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
