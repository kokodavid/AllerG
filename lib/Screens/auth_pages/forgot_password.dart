import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5],
              tileMode: TileMode.decal,
              colors: [
                AppColors.lightGrad,
                AppColors.lightBlueGrad,
              ])
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const Positioned(
              top: kToolbarHeight,
              right: 0,
              left: 0,
              child: Center(
                  child: Text(
                    "Password Reset",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*.55),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Password Reset",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10,left: 10,bottom: 15),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Enter the email address you used when you joined and we'll send instructions to reswt your password",
                          style: TextStyle(
                              fontSize: 14,
                          ),
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13,bottom: 35),
                      child: CustomEditText(
                        hintText: "Email",
                        obscurity: false,
                        icon: Icon(Icons.mail),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
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
                              ])
                      ),
                      child: const Center(
                        child: Text(
                          "Send",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );  }
}
