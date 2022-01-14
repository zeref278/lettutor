import 'package:flutter/material.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_text_field.dart';

class CustomPasswordField extends StatelessWidget {
  final String hText;
  final TextEditingController? textEditingController;

  const CustomPasswordField({
    required this.hText,
    this.textEditingController
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      child: TextField(
        controller: textEditingController,
        obscureText: true,
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
