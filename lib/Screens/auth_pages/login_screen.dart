import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/auth_pages/forgot_password.dart';
import 'package:allerg/Screens/auth_pages/sign_up_screen.dart';
import 'package:allerg/Screens/landing_pages/homepage.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:allerg/viewmodel/auth_service.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var usernameController = new TextEditingController();
  var passwordController = new TextEditingController();

  late AuthViewModel _authViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _authViewModel = context.watch<AuthViewModel>();
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
              ])),
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
                "Log In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * .25),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: CustomEditText(
                        hintText: "Username",
                        obscurity: false,
                        controller: usernameController,
                        icon: Icon(Icons.account_circle),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13, bottom: 20),
                      child: CustomEditText(
                        hintText: "Password",
                        obscurity: false,
                        controller: passwordController,
                        icon: Icon(Icons.visibility_off),
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
                              ])),
                      child: InkWell(
                        onTap: () async {
                          Map<String, String> credentials = {
                            'username': usernameController.text,
                            'password': passwordController.text
                          };

                          var response =
                              await _authViewModel.loginUser(credentials);

                          if (response) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()),
                                (route) => false);
                          }
                        },
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                      },
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "or Login with",
                          style: TextStyle(color: AppColors.dimColor),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _authViewModel.signInWithGoogle();
                            },
                            child: Image.asset("assets/images/google.png")),
                        GestureDetector(
                            onTap: () {
                             _authViewModel.signInWithFacebook();
                            },
                            child: Image.asset("assets/images/facebook.png")),
                        Image.asset("assets/images/apple.png"),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUp()));
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(vertical: 50),
                          child: const Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Don\'t have an account\t',
                              style: TextStyle(
                                  color: AppColors.dimColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ]))

                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
