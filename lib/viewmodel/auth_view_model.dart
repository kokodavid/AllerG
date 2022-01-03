import 'dart:io';

import 'package:allerg/Screens/auth_pages/login_screen.dart';
import 'package:allerg/Screens/landing_pages/homepage.dart';
import 'package:allerg/models/users.dart';
import 'package:allerg/viewmodel/base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

class AuthViewModel extends BaseViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  User? _user;

  User? get user => _user;

  String? _userLocation;

  String? get userLocation => _userLocation;

  String? _userIpAddress;

  String? get userIpAddress => _userIpAddress;

  FirebaseFirestore get fireStoreInstance => _firestoreInstance;

  LocationPermission? permission;

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const Homepage();
          } else {
            return const Login();
          }
        });
  }

  bool isUser() {
    _user = _firebaseAuth.currentUser;
    return _user != null;
  }

  //Facebook Login
  signInWithFacebook() async {
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
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken!.token);
        final result =
            await FirebaseAuth.instance.signInWithCredential(authCredential);
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

  //Google Login
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the authgroup details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Users userInfo = Users(
    //     username: credential.,
    //     password: passwordController.text,
    //     emailAddress: emailController.text,
    //     allergyType: '',
    //     picture: '',
    //     hasEpipen: 'false',
    //     ipAddress: _authViewModel.userIpAddress,
    //     location: _authViewModel.userLocation,
    //     createdOn: "${DateTime.now()}",
    //     updatedOn: "${DateTime.now()}"
    // );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithApple() async {}

  getUserLocation() async {
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    _userLocation = "${placemarks.first.name!}, ${placemarks.first.country}";
    notifyListeners();
    print("userlocation>>> ${placemarks.first}");
  }

  getUserIpAddress() async {
    var ipInfo = await WifiInfo().getWifiIP();

    _userIpAddress = ipInfo!.toString();
    notifyListeners();
    print("user ip address>> $ipInfo");
  }

  Future<bool> singUpNewUser(Users? userInfo) async {
    setBusy(true);
    showProgress('Creating account\nPlease wait');
    try {
      var response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userInfo!.emailAddress!,
          password: userInfo.password!); // var res = value.
      User? user = FirebaseAuth.instance.currentUser;

      await _firestoreInstance
          .collection("users")
          .doc(response.user!.uid)
          .set(userInfo.toJson());

      setBusy(false);
      dismissProgress();
      return true;
    } catch (e) {
      print("an error occurred>>> $e");
      setBusy(false);
      dismissProgress();
      return false;
    }
  }

  Future<bool> loginUser(Map<String, String> credentials) async {
    setBusy(true);
    showProgress('Logging in\nPlease wait');
    try {
      QuerySnapshot snap = await _firestoreInstance
          .collection("users")
          .where("username", isEqualTo: credentials['username'])
          .get();

      print("snap data>>> ${snap.docs.first.data().toString()}");

      if (snap.docs.isNotEmpty) {
        var response = await _firebaseAuth.signInWithEmailAndPassword(
            email: 'pundoarthur@gmail.com',
            password: credentials['password']!);

        setBusy(false);
        dismissProgress();
        return response.user != null;
      } else {
        print("snapshot>> ${snap.docs.toList().toString()}");
        dismissProgress();
        return false;
      }
    } catch (e, s) {
      showToast(e.toString());
      print("an error occurred>>> $e here $s");
      dismissProgress();
      return false;
    }
  }

  Future<Users> getUserProfile() async {
    var uid = _firebaseAuth.currentUser!.uid;

    var userProfile =
        await _firestoreInstance.collection("users").doc(uid).get();

    Users users = Users.fromJson(userProfile.data()!);

    return users;
  }

  Future<String> uploadProfilePicture(String path) async {
    isUser();

    showProgress('Uploading profile picture\nPlease wait');

    TaskSnapshot _storage = await _firebaseStorage
        .ref('profile_pictures/${_user!.uid}')
        .putFile(File(path));

    dismissProgress();
    return await _storage.ref.getDownloadURL();
  }

  Future<bool> updateUserInfo(Users userInfo) async {
    showProgress("Updating information\nPlease wait");

    try {
      await _firestoreInstance
          .collection("users")
          .doc("DuC6Hdfo6vZJssquoA0xKubHZii2")
          .set(userInfo.toJson());
      dismissProgress();
      return true;
    } catch (e) {
      showToast("$e");
      dismissProgress();
      return false;
    }
  }

//Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  showProgress(String p) {
    EasyLoading.show(status: p, maskType: EasyLoadingMaskType.black);
  }

  showToast(String t) {
    EasyLoading.showToast(t, toastPosition: EasyLoadingToastPosition.bottom);
  }

  dismissProgress() {
    EasyLoading.dismiss();
  }
}
