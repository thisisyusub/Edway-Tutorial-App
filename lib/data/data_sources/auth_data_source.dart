import '../models/login_body.dart';
import 'dio_configuration.dart';

class AuthDataSource {
  Future<bool> signIn(String username, String password) async {
    try {
      final loginBody = LoginBody(
        clientId: 'org.edway.webclient',
        clientSecret: 'r4D5PuJEYepOOjnYGRsdYsEgAB',
        grantType: 'password',
        username: username,
        password: password,
      ).toJson();

      final result = await dio.post('/connect/token', data: loginBody);

      if (result.statusCode != null) {
        if (result.statusCode! >= 200 && result.statusCode! <= 299) {
          return true;
        }
      }
    } catch (e, s) {
      print('$e => $s');
    }

    return false;
  }
}