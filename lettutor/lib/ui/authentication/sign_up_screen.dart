import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/ui/authentication/sign_in_screen.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_input_field.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_password_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const NameLogo(),
              SizedBox(height: size.height * 0.03),
              InputFieldCustom(
                hintText: 'Enter your full name',
                onChanged: (value) {},
              ),
              InputFieldCustom(
                icon: Icons.email,
                hintText: 'Enter your email',
                onChanged: (value) {},
              ),
              PasswordFieldCustom(
                hText: 'Enter your password',
                onChanged: (value) {},
              ),
              PasswordFieldCustom(
                hText: 'Confirm your password',
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.03),
              CustomRoundedButton(
                width: size.width * 0.9,
                textColor: Colors.black,
                text: 'SIGN UP',
                press: () {},
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account ? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  CustomTextButton(
                    title: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: darkYellow, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
