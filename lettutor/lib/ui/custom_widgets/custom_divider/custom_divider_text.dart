import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';

class CustomDividerText extends StatelessWidget {
  final Widget child;

  const CustomDividerText({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.9,
      child: Row(
        children: <Widget>[
          Container(
            width: 30,
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: child,
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
