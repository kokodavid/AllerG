import 'package:allerg/Screens/onBoarding_screens/splash_screen.dart';
import 'package:allerg/repository/authgroup/auth_repository.dart';
import 'package:allerg/viewmodel/auth_view_model.dart';
import 'package:allerg/viewmodel/base_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Resources/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.profileTile
    ..backgroundColor = AppColors.background
    ..indicatorColor = AppColors.profileTile
    ..textColor = Colors.white
    ..maskColor = AppColors.primary
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (BuildContext context) {},
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BaseViewModel()),
            ChangeNotifierProvider(create: (_) => AuthViewModel())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'SFpro'),
            home: const SplashScreen(),
            builder: EasyLoading.init(),
          ),
        ));
  }
}
