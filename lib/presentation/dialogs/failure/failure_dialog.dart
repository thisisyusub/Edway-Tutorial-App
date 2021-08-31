import 'package:flutter/material.dart';

class FailureDialog extends StatelessWidget {
  const FailureDialog({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Failure'),
      content: Text(
        message ??
            'Something goes wrong. Please '
                'try again!.',
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('OK'),
        ),
      ],
    );
  }
}
