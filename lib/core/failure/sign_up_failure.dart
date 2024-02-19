import 'package:firebase_auth/firebase_auth.dart';

class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class RegisterFailure extends Failure {
  RegisterFailure(super.errorMessage);

  factory RegisterFailure.fromSignUpErrorState(
      FirebaseAuthException registerException) {
    switch (registerException.code) {
      case 'weak-password':
        return RegisterFailure('The Password provided is too weak');
      case 'email-already-in-use':
        return RegisterFailure('The Account already exists for that mail.');
      case 'user-not-found':
        return RegisterFailure('No User Found for that email.');
      case 'wrong-password':
        return RegisterFailure('Wrong Password provided for that user.');
      default:
        return RegisterFailure("oops There was an error ");
    }
  }
}
