import 'package:allerg/BLoC/auth/auth_barrel.dart';
import 'package:allerg/Screens/onBoarding_screens/splash_screen.dart';
import 'package:allerg/provider/auth_provider.dart';
import 'package:allerg/repository/authgroup/auth_repository.dart';
import 'package:allerg/services/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthRepository _authRepository = AuthRepository();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();

    _authBloc = AuthBloc(authRepository: _authRepository);
    // _authBloc.dispatch(AppStart());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository: _authRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SFpro'),
        home: const SplashScreen(),
      ),
    );
  }
}
