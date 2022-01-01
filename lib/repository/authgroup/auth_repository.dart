import 'package:allerg/provider/auth_provider.dart';
import 'package:allerg/repository/authgroup/abstract_auth_repo.dart';
import 'package:allerg/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends AbstractAuthRepo {

  static AuthRepository? _instance;

  factory AuthRepository() => _instance ??= AuthRepository._();

  AuthRepository._();

  FirebaseAuth? _firebaseAuth;
  GoogleSignIn? _googleSignIn;

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _firebaseAuth!.currentUser!;

    return currentUser.displayName!.isNotEmpty;
  }

  @override
  Future<bool> signUp(String? email, String? password, String? username,
      String? userType, String? imageUrl, String? credential,
      String? uid) async {
    try {
      _firebaseAuth!.createUserWithEmailAndPassword(
          email: email!, password: password!).then((value) async {
        // var res = value.
        User? user = FirebaseAuth.instance.currentUser;

        FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'uid': user.uid,
          'email': email,
          'username': username,
          'password': password.hashCode,
          'imageUrl': '',
          'credential': '',
          'userType': 'email',
          'createdOn': DateTime.now(),
        });

        return true;
      });
      return true;
    } catch (e, s) {
      print("an error occurred> $e here> $s");
      return false;
    }
  }

  @override
  Future<bool> appleSignIn() {
    // TODO: implement appleSignIn
    throw UnimplementedError();
  }

  @override
  Future facebookSignIn() async {
    final fb = FacebookLogin();
    // Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
      // The user is suceessfully logged in
      // Send access token to server for validation and authgroup
        final FacebookAccessToken? accessToken = res.accessToken;
        final AuthCredential authCredential = FacebookAuthProvider.credential(
            accessToken!.token);
        final result = await FirebaseAuth.instance.signInWithCredential(
            authCredential);
        // Get profile data from facebook for use in the app
        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');
        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');
        // fetch user email
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');
        break;
      case FacebookLoginStatus.cancel:
      // In case the user cancels the login process
        break;
      case FacebookLoginStatus.error:
      // Login procedure failed
        print('Error while log in: ${res.error}');
        break;
    }
  }

  @override
  Future<bool> googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the authgroup details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!
        .authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    //TODO add relevant return
    return true;
  }

  Future<void> signOut() async {
     Future.wait([
      _firebaseAuth!.signOut(),
      _googleSignIn!.signOut(),
    ]);
  }
}