import 'package:allerg/Resources/colors.dart';
import 'package:allerg/auth_service.dart';
import 'package:allerg/constants/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    const Icon(Icons.arrow_back_ios),
                    const Text("Log In"),
                    Container()
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 230),
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
                      const Align(
                        alignment: Alignment.topLeft,
                          child: Text(
                              "Log In",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 20),
                        height: 60,
                        child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: textFormDecoration
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 20),
                        height: 60,
                        child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: textFormDecoration
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: AppColors.buttons,
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.1, 0.5],
                                colors: [
                                  AppColors.lightGradient,
                                  AppColors.lightText,
                                ])
                        ),
                        child: const Center(
                          child: Text(
                              "Sign In",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                          child: Text(
                              "Forgot Password ?",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.bold
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.all(18),
                          child: Text("or Login with")
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap:(){
                                AuthService().signInWithGoogle();
                              },
                              child: Image.asset(
                                  "assets/images/google.png"
                              )
                          ),
                          GestureDetector(
                            onTap: (){
                              AuthService().signInWithFacebook();
                            },
                              child: Image.asset(
                                  "assets/images/facebook.png"
                              )
                          ),
                          Image.asset("assets/images/apple.png"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                        child: Row(
                          children: const [
                            Text(
                                "Don't have an account ?"
                            ),
                            SizedBox(width: 10,),
                            Text(
                                "Sign Up.",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      )


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
