import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_text_field.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final bool? isReadOnly;
  final String hintText;
  final IconData icon;


   CustomInputField({
    required this.hintText,
    this.icon = Icons.person,
    this.textEditingController,
    this.isReadOnly
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      child: TextField(
        readOnly: isReadOnly ?? false,
        controller: textEditingController,
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
