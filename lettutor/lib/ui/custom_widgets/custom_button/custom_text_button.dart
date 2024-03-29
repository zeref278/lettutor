import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';

class CustomTextButton extends StatelessWidget {
  final bool login;
  final void Function() onPressed;
  final Widget title;

  CustomTextButton(
      {this.login = true, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed, child: title);
  }
}
