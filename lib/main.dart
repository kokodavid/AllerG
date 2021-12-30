import 'package:allerg/Screens/splash_screen.dart';
import 'package:allerg/provider/auth_provider.dart';
import 'package:allerg/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (_) => AuthProvider()),
        StreamProvider(
          create: (context) => context.read<AuthProvider>().authStateChanges,
          initialData: null,
        ),
      ],
      child: ScreenUtilInit(
        builder: () => MultiBlocProvider(

        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'SFpro'),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
