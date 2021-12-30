import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/homepage.dart';
import 'package:allerg/constants/constants.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:allerg/services/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController =  TextEditingController();
  TextEditingController? usernameController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    )),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: size.height*.20),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                    child: Column(
                      children: [
                         Container(
                           margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/google.png"),
                            Image.asset("assets/images/facebook.png"),
                            Image.asset("assets/images/apple.png"),
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.all(18),
                            child: Text(
                              "or register with e-mail",
                              style: TextStyle(
                                  color: AppColors.dimColor,
                                fontSize: 16
                              ),
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13,bottom: 10),
                          child: CustomEditText(
                            hintText: "E-mail",
                            obscurity: false,
                            icon: Icon(Icons.mail),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13,bottom: 20),
                          child: CustomEditText(
                            hintText: "Username",
                            obscurity: false,
                            icon: Icon(Icons.account_circle),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CustomEditText(
                            hintText: "Password",
                            obscurity: false,
                            icon: Icon(Icons.visibility_off),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CustomEditText(
                            hintText: "Repeat Password",
                            obscurity: false,
                            icon: Icon(Icons.visibility_off),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Homepage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
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
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));

                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: const Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Already have an account\t',
                                          style: TextStyle(
                                              color: AppColors.dimColor,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Log in',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ]
                                  )
                              )
                            /*Row(
                              children:  [
                                const Text(
                                    "Don't have an account ?"
                                ),
                                const SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
                                  },
                                  child: const Text(
                                      "Sign Up.",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                          ),
                        )



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
