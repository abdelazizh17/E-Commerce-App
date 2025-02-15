import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
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
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final authFirebaseService = AuthFirebaseServices();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signUp(SignUpData signUpData) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signUp(signUpData);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> login(LoginData loginData) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.login(loginData);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.resetPassword(email);
      emit(PasswordResetRequestSent());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> signInwithGoogle() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signInWithGoogle();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> signOutGoogle() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signOutGoogle();
      emit(LoggedOut());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signInWithFacebook();
      emit(AuthSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }

  Future<void> signOutFacebook() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signOutFacebook();
      emit(LoggedOut());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }
}
