import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_text_field.dart';

class InputFieldCustom extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const InputFieldCustom({
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      child: TextField(
        onChanged: onChanged,
        cursorColor: darkYellow,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: darkYellow,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
