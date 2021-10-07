import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/screens/login_screen/sign_in.dart';
import 'package:lettutor/screens/login_screen/widgets/name_logo.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/widgets/rounded_button.dart';
import 'package:lettutor/widgets/input_field_custom.dart';
import 'package:lettutor/widgets/text_button_custom.dart';
import 'package:lettutor/widgets/password_field_custom.dart';

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
                RoundedButton(
                  textColor: Colors.black,
                  text: 'SIGN UP',
                  press: () {},
                ),
                SizedBox(height: size.height * 0.05),
                TextButtonCustom(
                  login: false,
                  press: () {
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
          ),
        ),

    );
  }

}