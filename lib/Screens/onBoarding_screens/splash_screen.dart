import 'dart:async';

import 'package:allerg/Resources/colors.dart';
import 'package:allerg/Screens/auth_pages/login_screen.dart';
import 'package:allerg/Screens/landing_pages/homepage.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;
  bool initLoad = false;

  @override
  void initState() {
    // _loadWidget();
    super.initState();
    Future.microtask(() => context.read<AuthViewModel>().isUser());
    handleAuth();
  }

  handleAuth() async {
    AuthViewModel _authVM = new AuthViewModel();

    if (_authVM.isUser()) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
          (route) => false);
    } else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    }
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.4, 1],
                  colors: [AppColors.primary, AppColors.lightBlue])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SFpro'),
                ),
              ),
            ],
          )),
    );
  }
}
