import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_change_notifier.dart';
import 'pages/auth/auth_page.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthChangeNotifier()..checkAuth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: AuthPage(),
        // home: ChangeNotifierProvider<LoginChangeNotifier>(
        //   create: (context) => LoginChangeNotifier(),
        //   child: LoginPage(),
        // ),
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
    );
  }
}
