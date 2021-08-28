import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contractors/i_auth_repository.dart';

enum AuthState { initial, authenticated, unauthenticated }

class AuthBloc extends Cubit<AuthState> {
  AuthBloc(this.authRepository) : super(AuthState.initial);

  final IAuthRepository authRepository;

  void checkAuth() async {
    final result = await authRepository.checkAuth();
    print('result: $result');

    if (result.isSuccess()) {
      final isAuthenticated = result.getSuccess()!;
      emit(isAuthenticated
          ? AuthState.authenticated
          : AuthState.unauthenticated);
    } else if (result.isError()) {
      emit(AuthState.unauthenticated);
    }
  }
}
