import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AuthChangeNotifier extends ChangeNotifier {
  final _authStreamController = StreamController<AuthState>()
    ..add(AuthState.initial);

  Stream<AuthState> get authStream => _authStreamController.stream;

  void checkAuth() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final sharedPrefs = await SharedPreferences.getInstance();
      final authenticated = sharedPrefs.getBool('logged');

      if (authenticated != null && authenticated) {
        _authStreamController.add(AuthState.authenticated);
      } else {
        _authStreamController.add(AuthState.unauthenticated);
      }
    } catch (e, s) {
      print('$e => $s');
      _authStreamController.add(AuthState.unauthenticated);
    }
  }

  @override
  void dispose() {
    _authStreamController.close();
    super.dispose();
  }
}
