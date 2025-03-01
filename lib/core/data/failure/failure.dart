import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioException.response?.statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error, Please try again');
      default:
        return ServerFailure('Oops, there was an error, Please try again');
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          response['error']['message'] ?? 'Authentication error');
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later!');
    } else {
      return ServerFailure('Oops, there was an error, Please try again');
    }
  }
}

class NetworkException {}

class AuthFailure extends Failure {
  AuthFailure(super.message);

  factory AuthFailure.fromException(dynamic e) {
    if (e is FirebaseAuthException) {
      return _handleFirebaseAuthException(e);
    } else if (e is PlatformException) {
      return _handlePlatformException(e);
    } else if (e is FirebaseException) {
      return _handleFirebaseException(e);
    } else if (e is NetworkException) {
      return AuthFailure('No internet connection');
    } else {
      debugPrint(e.toString());
      return AuthFailure('Something went wrong');
    }
  }
}

AuthFailure _handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return AuthFailure('User not found');
    case 'wrong-password':
      return AuthFailure('Wrong password or Email');
    case 'email-already-in-use':
      return AuthFailure('Email is already in use');
    case 'invalid-email':
      return AuthFailure('Invalid email address');
    case 'invalid-credential':
      return AuthFailure('Wrong email or password. Try again.');
    case 'weak-password':
      return AuthFailure('Password is too weak');
    case 'sign_in_cancelled':
      return AuthFailure('Sign-in was cancelled');
    case 'facebook_auth_no_token':
      return AuthFailure('Facebook authentication failed: No access token.');
    case 'facebook_sign_in_cancelled':
      return AuthFailure('Sign-in was cancelled.');
    case 'facebook_sign_in_failed':
      return AuthFailure('Facebook sign-in failed.');
    default:
      return AuthFailure('Firebase Auth error: ${e.message}');
  }
}

AuthFailure _handlePlatformException(PlatformException e) {
  debugPrint(e.toString());
  return AuthFailure('Platform error: ${e.message}');
}

AuthFailure _handleFirebaseException(FirebaseException e) {
  return AuthFailure('Firebase error: ${e.message}');
}
