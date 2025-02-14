import 'package:e_commerce/feature/auth/data/models/login_data.dart';
import 'package:e_commerce/feature/auth/data/models/sign_up_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
