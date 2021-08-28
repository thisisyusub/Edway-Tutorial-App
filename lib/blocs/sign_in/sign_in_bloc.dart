import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/auth_data_source.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc {
  SignInBloc() {
    _outputController.add(SignInInitial());

    inputController.stream.listen((event) {
      if (event is LoginPressed) {
        _signIn(event.username, event.password);
      }
    });
  }

  final inputController = StreamController<SignInEvent>();
  final _outputController = StreamController<SignInState>.broadcast();

  Stream<SignInState> get signInState => _outputController.stream;

  void _signIn(String username, String password) async {
    try {
      _outputController.add(SignInInProgress());

      await Future.delayed(Duration(seconds: 3));

      final authDataSource = AuthDataSource();

      final result = await authDataSource.signIn(username, password);

      if (result != null) {
        final sharedPrefs = await SharedPreferences.getInstance();
        sharedPrefs.setBool('logged', true);

        _outputController.add(SignInSuccess());
      } else {
        _outputController.add(SignInFailure('Data is null!'));
      }
    } catch (e) {
      _outputController.add(SignInFailure(e.toString()));
    }
  }

  void dispose() {
    inputController.close();
    _outputController.close();
  }
}
