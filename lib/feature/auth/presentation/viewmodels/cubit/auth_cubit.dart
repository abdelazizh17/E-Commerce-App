import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/user_model.dart';
import 'package:e_commerce/feature/auth/data/models/login_data.dart';
import 'package:e_commerce/feature/auth/data/models/sign_up_data.dart';
import 'package:e_commerce/feature/auth/data/services/auth_firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  final authFirebaseService = AuthFirebaseServices();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearControllers() {
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  Future<void> signUp(SignUpData signUpData) async {
    emit(AuthLoading());
    try {
      final userModel = await authFirebaseService.signUp(signUpData);
      emit(AuthUserDataLoaded(userModel));
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> fetchUserData() async {
    emit(AuthLoading());
    try {
      final userModel = await authFirebaseService.fetchUserData();
      if (userModel != null) {
        emit(AuthUserDataLoaded(userModel));
      } else {
        emit(AuthInitial()); // fix loading issue
      }
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> login(LoginData loginData) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.login(loginData);
      final userModel = await authFirebaseService.fetchUserData();
      if (userModel != null) {
        emit(AuthUserDataLoaded(userModel));
      } else {
        emit(AuthInitial()); // fix loading issue
      }
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.resetPassword(email);
      emit(PasswordResetRequestSent());
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> signInwithGoogle() async {
    emit(AuthLoading());
    try {
      final userModel = await authFirebaseService.signInWithGoogle();
      emit(AuthUserDataLoaded(userModel));
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    try {
      final userModel = await authFirebaseService.signInWithFacebook();
      emit(AuthUserDataLoaded(userModel));
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }

  Future<void> signOutAllAccounts() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signOutAllAccounts();
      emit(LoggedOut());
    } catch (e) {
      emit(AuthError(AuthFailure.fromException(e).message));
    }
  }
}
