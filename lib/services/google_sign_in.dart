import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Initiate the authgroup procedure
  final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();
  // fetch the authgroup details from the request made earlier
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  // Create a new credential for signing in with google
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}