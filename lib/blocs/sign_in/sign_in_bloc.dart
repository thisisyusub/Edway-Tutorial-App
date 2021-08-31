import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractors/i_auth_repository.dart';

part 'sign_in_state.dart';
part 'sign_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.authRepository) : super(SignInInitial());

  final IAuthRepository authRepository;

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is LoginPressed) {
      final usernameEmpty = event.username.trim().isEmpty;
      final passwordEmpty = event.password.trim().isEmpty;

      if (usernameEmpty || passwordEmpty) {
        var emptyFields = <EmptyFields>[];

        emptyFields.addAll(
          [
            if (usernameEmpty) EmptyFields.username,
            if (passwordEmpty) EmptyFields.password,
          ],
        );

        yield SignInEmptyFieldCase(emptyFields);
        return;
      }

      yield SignInInProgress();

      final result = await authRepository.signIn(
        event.username,
        event.password,
      );

      if (result.isSuccess()) {
        yield SignInSuccess();
      } else if (result.isError()) {
        final error = result.getError();
        yield SignInFailure(error!.message);
      }
    }
  }
}
