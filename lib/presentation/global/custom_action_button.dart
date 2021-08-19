import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class CustomActionButton extends StatelessWidget {
  final String title;
  final ButtonSize? buttonSize;
  final Color? color;
  final Color? splashColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const CustomActionButton({
    Key? key,
    required this.title,
    this.buttonSize = ButtonSize.medium,
    this.color = Colors.blue,
    this.splashColor = Colors.grey,
    this.textColor = Colors.black,
    this.onTap,
  }) : super(key: key);

  double _getButtonHeight(ButtonSize buttonSize) {
    switch (buttonSize) {
      case ButtonSize.small:
        return 40.0;
      case ButtonSize.medium:
        return 60.0;
      case ButtonSize.large:
        return 80.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: _getButtonHeight(buttonSize ?? ButtonSize.small),
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(16.0),
        onTap: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
