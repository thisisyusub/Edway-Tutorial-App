import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../blocs/sign_in/sign_in_bloc.dart';
import '../../../providers/auth_change_notifier.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';
import 'widgets/auth_loading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: context.read<AuthChangeNotifier>().authStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == AuthState.authenticated) {
              return HomePage();
            } else if (snapshot.data == AuthState.unauthenticated) {
              return Provider<SignInBloc>(
                create: (context) => SignInBloc(),
                child: LoginPage(),
              );
            } else {
              return AuthLoading();
            }
          }

          return AuthLoading();
        },
      ),
    );
  }
}
