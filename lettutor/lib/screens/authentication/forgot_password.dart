import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/screens/authentication/widgets/name_logo.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/widgets/rounded_button.dart';
import 'package:lettutor/widgets/input_field_custom.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const NameLogo(),
              SizedBox(height: size.height * 0.2),
              const Text(
                "We'll send you a link to reset your password",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              InputFieldCustom(
                hintText: 'Enter your email',
                icon: Icons.email ,
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.1),
              RoundedButton(
                textColor: Colors.black,
                text: 'SEND',
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
