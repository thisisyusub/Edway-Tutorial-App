import 'package:flutter/material.dart';

import '../data/data_sources/auth_data_source.dart';

class AuthChangeNotifier extends ChangeNotifier {
  bool inProgress = false;
  bool isFailure = false;
  bool isSuccess = false;

  void login(String username, String password) async {
    inProgress = true;
    notifyListeners();

    final authDataSource = AuthDataSource();

    final result = await authDataSource.signIn(username, password);

    final resultInNotNull = result != null;

    inProgress = false;
    isSuccess = resultInNotNull; // false
    isFailure = !resultInNotNull; // true

    notifyListeners();
  }
}
