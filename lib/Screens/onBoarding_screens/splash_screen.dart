import 'dart:async';

import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';

import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;

  @override
  void initState() {
    _loadWidget();
    super.initState();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const OnBoardingScreen()));
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
                colors: [
                  AppColors.primary,
                  AppColors.lightBlue
                ])
        ),
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
              padding: EdgeInsets.only(top:30.0),
              child: Text(
                  "Welcome!",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SFpro'
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
