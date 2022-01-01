import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:flutter/material.dart';

class AllergyInformation extends StatefulWidget {
  const AllergyInformation({Key? key}) : super(key: key);

  @override
  _AllergyInformationState createState() => _AllergyInformationState();
}

class _AllergyInformationState extends State<AllergyInformation> {
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
                              "Allergy Information",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Allergy Type',
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
                      height: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.lightText
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Height',
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
                                    text: 'Weight',
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
                        hintText: "First Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: const [
                            Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Do you have an Epi Pen ?',
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
                            ),

                          ],
                        )
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
