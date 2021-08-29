import 'package:edway_tutorial_app/blocs/sign_in/sign_in_event.dart';
import 'package:edway_tutorial_app/blocs/sign_in/sign_in_state.dart';
import 'package:edway_tutorial_app/presentation/global/custom_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocs/sign_in/sign_in_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Provider.of<SignInBloc>(context).signInState.listen((event) {
      if (event is SignInSuccess) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context);

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
            Image.asset(
              'assets/images/login.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
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
            StreamBuilder<SignInState>(
                stream: signInBloc.signInState,
                builder: (context, stateSnapshot) {
                  if (stateSnapshot.hasData &&
                      stateSnapshot.data is SignInInProgress) {
                    return CircularProgressIndicator();
                  }

                  return CustomActionButton(
                    title: 'Log in',
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onTap: () {
                      signInBloc.inputController.add(
                        LoginPressed(
                          username: username.text,
                          password: password.text,
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
