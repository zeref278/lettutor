import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Widget title;

  const CustomIconButton(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 10,
        ),
        icon,
        const SizedBox(
          width: 15,
        ),
        title,
      ],
    );
  }
}
