import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_change_notifier.dart';
import '../../../providers/login_change_notifier.dart';
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
              return ChangeNotifierProvider<LoginChangeNotifier>(
                create: (context) => LoginChangeNotifier(),
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
