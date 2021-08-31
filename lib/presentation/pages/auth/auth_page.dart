import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/sign_in/sign_in_bloc.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import 'widgets/auth_loading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state == AuthState.initial) {
            return AuthLoading();
          } else if (state == AuthState.authenticated) {
            return HomePage();
          } else {
            return BlocProvider<SignInBloc>(
              create: (context) => SignInBloc(
                context.read<IAuthRepository>(),
              ),
              child: LoginPage(),
            );
          }
        },
      ),
    );
  }
}
