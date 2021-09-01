import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/requests/login_body.dart';
import '../models/responses/login_response.dart';
import 'dio_configuration.dart';

/// singleton
/// lazy singleton

class AuthDataSource {
  Future<LoginResponse> signIn(String username, String password) async {
    final loginBody = LoginBody(
      clientId: 'org.edway.webclient',
      clientSecret: 'r4D5PuJEYepOOjnYGRsdYsEgAB',
      grantType: 'password',
      username: username,
      password: password,
    ).toJson();

    final result = await identityDio.post(
      '/connect/token',
      options: Options(
        contentType: "application/x-www-form-urlencoded",
      ),
      data: loginBody,
    );

    return LoginResponse.fromJson(result.data);
  }

  Future<bool?> isAuthenticated() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('logged');
  }
}
