import 'package:flutter/material.dart';

import '../data/data_sources/auth_data_source.dart';

class AuthChangeNotifier extends ChangeNotifier {
  bool inProgress = false;
  bool isFailure = false;
  bool isSuccess = false;

  void login(String username, String password) async {
    inProgress = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3));
    final authDataSource = AuthDataSource();

    final result = await authDataSource.signIn(username, password);

    inProgress = false;
    isSuccess = result; // false
    isFailure = !result; // true

    notifyListeners();
  }
}
