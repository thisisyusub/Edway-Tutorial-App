import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';
import '../data/contractors/i_auth_repository.dart';
import '../data/repositories/impl_auth_repository.dart';
import 'pages/auth/auth_page.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IAuthRepository>(
      create: (_) => ImplAuthRepository(),
      child: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          context.read<IAuthRepository>(),
        )..checkAuth(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: AuthPage(),
          onGenerateRoute: (routeSettings) {
            switch (routeSettings.name) {
              case '/home':
                return MaterialPageRoute(
                  builder: (_) => HomePage(),
                );
              default:
                return MaterialPageRoute(
                  builder: (_) => Scaffold(
                    body: Center(
                      child: Text(
                        'Page with name ${routeSettings.name}'
                        ' is not defined!',
                      ),
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
