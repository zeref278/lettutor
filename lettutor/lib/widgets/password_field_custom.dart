import 'package:flutter/material.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/widgets/text_field_custom.dart';

class PasswordFieldCustom extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hText;

  const PasswordFieldCustom({
    required this.hText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: defaultColor,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: darkYellow,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: darkYellow,
          ),
          hintText: hText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}