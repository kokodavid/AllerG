import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication{
   final FirebaseAuth _auth;
   FirebaseAuthentication(this._auth);

  Future<String> signUp(String email, String password, String username) async {
    try{
       await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
         // var res = value.
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'uid': user.uid,
          'email': email,
          'username': username,
          'password': password,
        });
      });
      return "Signed Up";
    } catch(e, s) {
      print("an error occurred> $e here> $s");
      return username;
    }
  }
}