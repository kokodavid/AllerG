import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginInformation extends StatefulWidget {
  const LoginInformation({Key? key}) : super(key: key);

  @override
  _LoginInformationState createState() => _LoginInformationState();
}

class _LoginInformationState extends State<LoginInformation> {
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<AuthViewModel>().getUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _authViewModel = context.watch<AuthViewModel>();

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
                              "Login Information",
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
                                    text: 'Username',
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
                                    text: 'Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CustomEditText(
                        hintText: "First Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Divider(
                        color: AppColors.profileTile,
                        thickness: 2,
                        height: 15,
                        endIndent: 15,
                        indent: 15,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.topLeft,
                        child: const Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Change Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ]
                            )
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CustomEditText(
                        hintText: "First Name",
                        obscurity: false,
                        icon: Icon(Icons.portrait),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: CustomEditText(
                        hintText: "First Name",
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
              )

            ],
          ),
        ),
      ),
    );
  }
}
