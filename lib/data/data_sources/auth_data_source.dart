import 'package:dio/dio.dart';

import '../models/requests/login_body.dart';
import '../models/responses/login_response.dart';
import 'dio_configuration.dart';

class AuthDataSource {
  Future<LoginResponse?> signIn(String username, String password) async {
    try {
      final loginBody = LoginBody(
        clientId: 'org.edway.webclient',
        clientSecret: 'r4D5PuJEYepOOjnYGRsdYsEgAB',
        grantType: 'password',
        username: username,
        password: password,
      ).toJson();

      final result = await dio.post(
        '/connect/token',
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ),
        data: loginBody,
      );

      print(result);

      if (result.statusCode != null) {
        if (result.statusCode! >= 200 && result.statusCode! <= 299) {
          final loginResponse = LoginResponse.fromJson(result.data);
          print(loginResponse);

          return LoginResponse.fromJson(result.data);
        }
      }
    } catch (e, s) {
      print('$e => $s');
    }

    return null;
  }
}
