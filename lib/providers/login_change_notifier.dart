import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_sources/auth_data_source.dart';

class LoginChangeNotifier extends ChangeNotifier {
  bool inProgress = false;
  bool isFailure = false;
  bool isSuccess = false;

  void login(String username, String password) async {
    inProgress = true;
    notifyListeners();

    final authDataSource = AuthDataSource();

    final result = await authDataSource.signIn(username, password);

    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('logged', true);

    final resultInNotNull = result != null;

    inProgress = false;
    isSuccess = resultInNotNull;
    isFailure = !resultInNotNull;

    notifyListeners();
  }
}
