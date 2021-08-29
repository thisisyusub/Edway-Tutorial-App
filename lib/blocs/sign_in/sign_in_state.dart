// enum SignInState {initial, inProgress, failure, success }

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInInProgress extends SignInState {}

class SignInFailure extends SignInState {
  final String message;

  SignInFailure(this.message);
}

class SignInSuccess extends SignInState {}
