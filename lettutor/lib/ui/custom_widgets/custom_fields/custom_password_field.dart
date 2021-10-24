import 'package:flutter/material.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_text_field.dart';

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
        cursorColor: defaultPrimaryColor,
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
