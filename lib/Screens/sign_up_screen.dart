import 'package:allerg/Resources/colors.dart';
import 'package:allerg/constants/constants.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    const Text("Sign Up"),
                    Container()
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
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
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
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
                          child: Text("or register with e-mail")
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
                            "Sign Up",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                        child: Row(
                          children: const [
                            Text(
                                "Already have an account"
                            ),
                            SizedBox(width: 10,),
                            Text(
                              "Log In.",
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
