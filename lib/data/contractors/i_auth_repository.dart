import 'package:multiple_result/multiple_result.dart';

import '../failures.dart';
import '../models/responses/login_response.dart';

abstract class IAuthRepository {
  Future<Result<CheckAuthFailure, bool>> checkAuth();

  Future<Result<SignInFailure, LoginResponse>> signIn(
    String username,
    String password,
  );
}
