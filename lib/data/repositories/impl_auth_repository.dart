import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../contractors/i_auth_repository.dart';
import '../data_sources/auth_data_source.dart';
import '../failures.dart';
import '../models/responses/login_response.dart';

class ImplAuthRepository implements IAuthRepository {
  final _authDataSource = getIt.get<AuthDataSource>();

  @override
  Future<Result<CheckAuthFailure, bool>> checkAuth() async {
    try {
      final isAuthenticated = await _authDataSource.isAuthenticated();
      return Success(isAuthenticated ?? false);
    } catch (e) {
      return Error(CheckAuthFailure());
    }
  }

  @override
  Future<Result<SignInFailure, LoginResponse>> signIn(
    String username,
    String password,
  ) async {
    try {
      final result = await _authDataSource.signIn(username, password);
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool('logged', true);
      sharedPrefs.setString('accessToken', result.accessToken);
      return Success(result);
    } on DioError catch (e, s) {
      print('$e => $s');
      return Error(SignInFailure(e.message));
    } catch (e) {
      return Error(SignInFailure(e.toString()));
    }
  }
}
