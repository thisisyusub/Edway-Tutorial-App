part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class LoginPressed extends SignInEvent {
  final String username;
  final String password;

  LoginPressed({
    required this.username,
    required this.password,
  });
}
