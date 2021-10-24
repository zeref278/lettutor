import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';

class TextFieldCustom extends StatelessWidget {
  final Widget child;
  const TextFieldCustom({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: backgroundTextFieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
