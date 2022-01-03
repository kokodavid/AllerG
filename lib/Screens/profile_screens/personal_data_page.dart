import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/border_edit_text.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  _PersonalDataState createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String _dropDownValue = 'Gender';
  String initialCountry = 'NG';
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      child: BorderEditText(
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
                      child: BorderEditText(
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
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 60,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: AppColors.lightText),
                          color: Colors.white
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                          CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'KE',
                          favorite: ['+39','FR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                            Container(width: 1, color: AppColors.lightText),
                            Expanded(
                                child:TextFormField(
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                      hintText: "Phone Number"),
                                ),
                            )// This is divider

                          ],
                        ),
                      ),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 60,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: AppColors.lightText),
                          color: Colors.white
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: print,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: 'KE',
                              favorite: ['+39','FR'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                            ),
                            Container(width: 1, color: AppColors.lightText),
                            Expanded(
                              child:TextFormField(
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                    hintText: "Phone Number"),
                              ),
                            )// This is divider

                          ],
                        ),
                      ),
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
                      child: BorderEditText(
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
                      width: MediaQuery.of(context).size.width,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: AppColors.lightText),
                            color: Colors.white
                        ),
                      margin: EdgeInsets.only(bottom: 20),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: _dropDownValue == null
                                ? Text('Gender')
                                : Text(
                              _dropDownValue,
                              style: TextStyle(color: Colors.black),
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.black),
                            items: ['Male', 'Female'].map(
                                  (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(val),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                    () {
                                },
                              );
                            },
                          ),
                        ),
                      )
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
                      child: BorderEditText(
                        hintText: "DOB",
                        obscurity: false,
                        icon: Icon(Icons.calendar_today),
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
                      child: BorderEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.hourglass_empty),
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
                      child: BorderEditText(
                        hintText: "Gender",
                        obscurity: false,
                        icon: Icon(Icons.place),
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
