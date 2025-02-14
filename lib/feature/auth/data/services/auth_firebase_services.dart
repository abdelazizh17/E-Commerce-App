import 'package:e_commerce/feature/auth/data/models/login_data.dart';
import 'package:e_commerce/feature/auth/data/models/sign_up_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebaseServices {
  Future<void> signUp(SignUpData signUpModel) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpModel.email,
      password: signUpModel.password,
    );
  }

  Future<void> login(LoginData loginData) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginData.email,
      password: loginData.password,
    );
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOutGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
  }
}
