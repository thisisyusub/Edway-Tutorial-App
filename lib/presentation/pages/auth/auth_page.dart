import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../blocs/sign_in/sign_in_bloc.dart';
import '../../../data/contractors/i_auth_repository.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import 'widgets/auth_loading.dart';
import '../../../data/contractors/i_path_repository.dart';
import '../../../data/repositories/impl_path_repository.dart';
import '../../../blocs/paths/paths_bloc.dart';

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
            return RepositoryProvider<IPathRepository>(
              create: (_) => ImplPathRepository(),
              child: BlocProvider<PathsCubit>(
                create: (context) => PathsCubit(
                  context.read<IPathRepository>(),
                )..getPaths(),
                child: HomePage(),
              ),
            );
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
