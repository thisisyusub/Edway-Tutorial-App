import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_change_notifier.dart';
import 'pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ChangeNotifierProvider<AuthChangeNotifier>(
        create: (context) => AuthChangeNotifier(),
        child: LoginPage(),
      ),
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => LoginPage(),
      // },
    );
  }
}
