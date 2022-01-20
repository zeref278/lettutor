import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  final String hText;
  final TextEditingController? textEditingController;

  const CustomPasswordField({
    required this.hText,
    this.textEditingController
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldCustom(
      child: TextField(
        controller: widget.textEditingController,
        obscureText: _isHide,
        cursorColor: defaultPrimaryColor,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: darkYellow,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isHide ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill ,
              color: darkYellow,
            ), onPressed: () { setState(() {
              _isHide = !_isHide;
            }); },

          ),
          hintText: widget.hText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
