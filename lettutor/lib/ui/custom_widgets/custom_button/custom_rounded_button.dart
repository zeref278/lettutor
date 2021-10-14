import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';


class CustomRoundedButton extends StatelessWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  final double width;
  const CustomRoundedButton({
    required this.text,
    required this.press,
    required this.width,
    this.color = defaultColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: newElevatedButton(),
      ),
    );
  }


  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }
}