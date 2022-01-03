import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/landing_pages/homepage.dart';
import 'package:allerg/constants/custom_edit_text.dart';
import 'package:allerg/models/users.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AuthViewModel _authViewModel;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() => (context).read<AuthViewModel>().getUserLocation());
    Future.microtask(() => (context).read<AuthViewModel>().getUserIpAddress());
  }

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
        key: _scaffoldKey,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: size.height * .20),
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () async {
                                  var res =
                                      await _authViewModel.signInWithGoogle();

                                  if (res) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()),
                                        (route) => false);
                                  } else {
                                    EasyLoading.show(
                                        status: 'Not a valid account',
                                        maskType: EasyLoadingMaskType.black);
                                  }
                                },
                                child: Image.asset("assets/images/google.png")),
                            InkWell(
                                onTap: () async {
                                  var res = await _authViewModel.signInWithFacebook();

                                  if (res) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()),
                                            (route) => false);
                                  } else {
                                    EasyLoading.show(
                                        status: 'Not a valid account',
                                        maskType: EasyLoadingMaskType.black);
                                  }
                                },
                                child: Image.asset("assets/images/facebook.png")),
                            Image.asset("assets/images/apple.png"),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.all(18),
                            child: const Text(
                              "or register with e-mail",
                              style: TextStyle(
                                  color: AppColors.dimColor, fontSize: 16),
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 13, bottom: 10),
                          child: CustomEditText(
                            hintText: "E-mail",
                            obscurity: false,
                            controller: emailController,
                            icon: Icon(Icons.mail),
                            errorText: 'invalid email',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 13, bottom: 20),
                          child: CustomEditText(
                            hintText: "Username",
                            obscurity: false,
                            controller: usernameController,
                            icon: Icon(Icons.account_circle),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CustomEditText(
                            hintText: "Password",
                            controller: passwordController,
                            obscurity: true,
                            icon: Icon(Icons.visibility_off),
                            errorText: 'Invalid password',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: CustomEditText(
                            hintText: "Repeat Password",
                            obscurity: true,
                            controller: confirmPasswordController,
                            icon: Icon(Icons.visibility_off),
                            errorText: 'Invalid password',
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              Users userInfo = Users(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  emailAddress: emailController.text,
                                  allergyType: '',
                                  picture: '',
                                  hasEpipen: 'false',
                                  ipAddress: _authViewModel.userIpAddress,
                                  location: _authViewModel.userLocation,
                                  createdOn: "${DateTime.now()}",
                                  updatedOn: "${DateTime.now()}");

                              var response =
                                  await _authViewModel.singUpNewUser(userInfo);

                              if (response) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()),
                                    (route) => false);
                              }
                            }
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
                                    ])),
                            child: const Center(
                              child: Text(
                                "Sign Up",
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
                                builder: (context) => const SignUp()));
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              child: const Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: 'Already have an account\t',
                                  style: TextStyle(
                                      color: AppColors.dimColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'Log in',
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ]))),
                        )
                      ],
                    ),
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
