import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/data/models/firebase_path.dart';
import 'package:e_commerce/core/data/models/user_model.dart';
import 'package:e_commerce/feature/auth/data/models/login_data.dart';
import 'package:e_commerce/feature/auth/data/models/sign_up_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthFirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  Future<UserModel> signUp(SignUpData signUpModel) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: signUpModel.email,
      password: signUpModel.password,
    );

    final user = userCredential.user;

    //I implemented this condition to ensure it doesn't throw an error or crash if the user is not signed in
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user_null',
        message: 'User data is null after sign-in',
      );
    }
    final userModel = UserModel(
      uid: user.uid,
      userName: signUpModel.name,
      email: signUpModel.email,
    );
    await _usersCollection.doc(user.uid).set(userModel.toJson());
    return userModel;
  }

  Future<UserModel?> fetchUserData() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final snapshot = await _usersCollection.doc(user.uid).get();
      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<void> login(LoginData loginData) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginData.email,
      password: loginData.password,
    );
  }

  Future<void> logout() => _firebaseAuth.signOut();

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<UserModel> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'sign_in_cancelled',
        message: 'User cancelled sign-in',
      );
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await _firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user;
    //I implemented this condition to ensure it doesn't throw an error or crash if the user is not signed in
    if (user == null) {
      throw FirebaseAuthException(
        code: 'user_null',
        message: 'User data is null after sign-in',
      );
    }
    final userModel = UserModel(
      uid: user.uid,
      userName: user.displayName,
      email: user.email,
    );
    await _usersCollection.doc(user.uid).set(userModel.toJson());
    return userModel;
  }

  Future<void> signOutGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
  }

  Future<UserModel> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {
      final AccessToken? accessToken = loginResult.accessToken;

      if (accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        final user = userCredential.user;

        if (user == null) {
          throw FirebaseAuthException(
            code: 'user_null',
            message: 'User data is null after sign-in',
          );
        }
        final userModel = UserModel(
          uid: user.uid,
          userName: user.displayName,
          email: user.email,
        );
        await _usersCollection.doc(user.uid).set(userModel.toJson());
        return userModel;
      } else {
        throw FirebaseAuthException(
          code: 'facebook_auth_no_token',
          message: 'Facebook authentication failed: No access token.',
        );
      }
    } else if (loginResult.status == LoginStatus.cancelled) {
      throw FirebaseAuthException(
        code: 'facebook_sign_in_cancelled',
        message: 'User cancelled Facebook sign-in.',
      );
    } else {
      throw FirebaseAuthException(
        code: 'facebook_sign_in_failed',
        message: loginResult.message ??
            'Facebook sign-in failed for unknown reasons.',
      );
    }
  }

  Future<void> signOutFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  Future<void> signOutAllAccounts() async {
    await signOutFacebook();
    await signOutGoogle();
    await logout();
  }
}
