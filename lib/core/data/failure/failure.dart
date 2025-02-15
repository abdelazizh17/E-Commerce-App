import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Failure {
  final String message;

  const Failure(this.message);

  factory Failure.fromException(dynamic e) {
    if (e is FirebaseAuthException) {
      return _handleFirebaseAuthException(e);
    } else if (e is PlatformException) {
      return _handlePlatformException(e);
    } else if (e is FirebaseException) {
      return _handleFirebaseException(e);
    } else if (e is NetworkException) {
      return const Failure('No internet connection');
    } else {
      debugPrint(e.toString());
      return const Failure('Something went wrong');
    }
  }
}

class NetworkException {}

Failure _handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return const Failure('User not found');
    case 'wrong-password':
      return const Failure('Wrong password or Email');
    case 'email-already-in-use':
      return const Failure('Email is already in use');
    case 'invalid-email':
      return const Failure('Invalid email address');
    case 'weak-password':
      return const Failure('Password is too weak');
    case 'sign_in_cancelled':
      return const Failure('Sign-in was cancelled');
    default:
      return Failure('Firebase Auth error: ${e.message}');
  }
}

Failure _handlePlatformException(PlatformException e) {
  debugPrint(e.toString());
  return Failure('Platform error: ${e.message}');
}

Failure _handleFirebaseException(FirebaseException e) {
  return Failure('Firebase error: ${e.message}');
}
