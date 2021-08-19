import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_change_notifier.dart';
import '../../global/custom_action_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();

  final password = TextEditingController();

  @override
  void initState() {
    super.initState();

    final authNotifier = context.read<AuthChangeNotifier>();

    authNotifier.addListener(() {
      if (authNotifier.isFailure) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Failure!'),
              content: Text('Failure occurred! Please, try again!'),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      border: OutlineInputBorder(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
              decoration: decoration.copyWith(
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: decoration.copyWith(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Keep me signed in'),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Consumer<AuthChangeNotifier>(
              builder: (context, authNotifier, child) {
                if (authNotifier.inProgress) {
                  return CircularProgressIndicator();
                }

                return CustomActionButton(
                  title: 'Log in',
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onTap: () {
                    context.read<AuthChangeNotifier>().login(
                          username.text,
                          password.text,
                        );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
