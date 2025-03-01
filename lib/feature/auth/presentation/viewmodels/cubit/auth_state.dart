part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthError extends AuthState {
  final String errMessage;

  AuthError(this.errMessage);
}

class PasswordResetRequestSent extends AuthState {}

class LoggedOut extends AuthState {}

class AuthUserDataLoaded extends AuthState {
  final UserModel userModel;
  AuthUserDataLoaded(this.userModel);
}
