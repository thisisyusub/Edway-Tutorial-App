import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/sign_in/sign_in_bloc.dart';
import '../../global/custom_action_button.dart';
import '../../dialogs/failure/failure_dialog.dart';

/// BlocBuilder
/// BlocListener
/// BlocConsumer (BlocBuilder + BlocListener)

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();

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
        child: BlocConsumer<SignInBloc, SignInState>(
          buildWhen: (_, current) => current is! SignInSuccess,
          listenWhen: (_, current) =>
              current is SignInFailure || current is SignInSuccess,
          listener: (context, state) {
            if (state is SignInFailure) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return FailureDialog(message: state.message);
                  });
            } else if (state is SignInSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          builder: (context, state) {
            String? usernameError;
            String? passwordError;

            if (state is SignInEmptyFieldCase) {
              usernameError = state.emptyFields.contains(EmptyFields.username)
                  ? 'useraname cannot be empty!'
                  : null;

              passwordError = state.emptyFields.contains(EmptyFields.password)
                  ? 'password cannot be empty!'
                  : null;
            }

            return Column(
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
                    errorText: usernameError,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: password,
                  decoration: decoration.copyWith(
                    hintText: 'Password',
                    errorText: passwordError,
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
                if (state is! SignInInProgress)
                  CustomActionButton(
                    title: 'Log in',
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onTap: () {
                      context.read<SignInBloc>().add(LoginPressed(
                            username: username.text,
                            password: password.text,
                          ));
                    },
                  )
                else
                  CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
