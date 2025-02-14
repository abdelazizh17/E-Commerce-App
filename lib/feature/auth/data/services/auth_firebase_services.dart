import 'package:e_commerce/feature/auth/data/models/sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServices {
  Future<void> signUp(SignUpModel signUpModel) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUpModel.email,
      password: signUpModel.password,
    );
  }
}
