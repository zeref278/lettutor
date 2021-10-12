import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';

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
        color: backgroundFieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}