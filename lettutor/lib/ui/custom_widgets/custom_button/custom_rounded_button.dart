import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color color, textColor;
  final double width;
  const CustomRoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.color = defaultPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
      ),
    );
  }
}
