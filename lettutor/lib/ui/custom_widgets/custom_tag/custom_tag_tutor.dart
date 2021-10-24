import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';

class CustomTagTutor extends StatelessWidget {
  final Text text;

  CustomTagTutor({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: defaultPrimaryColor),
          color: defaultPrimaryColor.withOpacity(0.2)),
    );
  }
}
