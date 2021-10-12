import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';

class TextButtonCustom extends StatelessWidget {
  final bool login;
  final void Function() press;

  const TextButtonCustom({
    this.login = true,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: const TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              color: darkYellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}