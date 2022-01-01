import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String initialCountry = 'NG';
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(
          top: kToolbarHeight
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Positioned(
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.arrow_back_ios),
                        Center(
                            child: Text(
                              "Personal Data",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            )),
                        Text(
                            "Save",
                          style: TextStyle(
                            color: AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 29),
                height: size.height*.11,
                width: size.width*.25,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(image: AssetImage('assets/images/boardone.png',),fit: BoxFit.cover)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Your First Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "First Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Your Last Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Last Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Phone Number',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            )
                        )
                    ),
                    // InternationalPhoneNumberInput(
                    //   onInputChanged: (PhoneNumber number) {
                    //     print(number.phoneNumber);
                    //   },
                    //   onInputValidated: (bool value) {
                    //     print(value);
                    //   },
                    //   selectorConfig: const SelectorConfig(
                    //     selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    //   ),
                    //   ignoreBlank: false,
                    //   autoValidateMode: AutovalidateMode.disabled,
                    //   selectorTextStyle: TextStyle(color: Colors.black),
                    //   initialValue: number,
                    //   textFieldController: controller,
                    //   formatInput: false,
                    //   keyboardType:
                    //   TextInputType.numberWithOptions(signed: true, decimal: true),
                    //   inputBorder: OutlineInputBorder(),
                    //   onSaved: (PhoneNumber number) {
                    //     print('On Saved: $number');
                    //   },
                    // ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (phone) {
                        // print('Country code changed to: ' + phone.countryCode);
                      },
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Emergency Phone Number',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (phone) {
                        // print('Country code changed to: ' + phone.countryCode);
                      },
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Contact Name',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Contact Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Gender',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Date of Birth',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Age',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: AppColors.buttons,
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.lightGradient,
                                AppColors.lightText,
                              ])),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),





                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
