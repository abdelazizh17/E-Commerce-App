import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/feature/auth/data/models/sign_up_model.dart';
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
  Future<void> signUp(SignUpModel signUpModel) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.signUp(signUpModel);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(Failure.fromException(e).message));
    }
  }
}
