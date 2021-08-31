// enum SignInState {initial, inProgress, failure, success }
part of 'sign_in_bloc.dart';

enum EmptyFields { username, password }

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInInProgress extends SignInState {}

class SignInFailure extends SignInState {
  final String? message;

  SignInFailure([this.message]);
}

class SignInSuccess extends SignInState {}

class SignInEmptyFieldCase extends SignInState {
  final List<EmptyFields> emptyFields;

  SignInEmptyFieldCase(this.emptyFields);
}
