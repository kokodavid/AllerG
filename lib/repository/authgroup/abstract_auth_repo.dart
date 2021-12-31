import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuthRepo{
  Future<bool> isAuthenticated();

  Future<bool> signUp(String? email, String? password, String? username,
      String? userType, String? imageUrl, String? credential, String? uid);

  Future<User> getUser();

  Future<dynamic> facebookSignIn();

  Future<bool> googleSignIn();

  Future<bool> appleSignIn();

}