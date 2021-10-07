import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:lettutor/screens/login_screen/sign_up.dart';
import 'package:lettutor/screens/login_screen/widgets/name_logo.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/widgets/rounded_button.dart';
import 'package:lettutor/widgets/input_field_custom.dart';
import 'package:lettutor/widgets/text_button_custom.dart';
import 'package:lettutor/widgets/password_field_custom.dart';
import './widgets/social_login_options.dart';
import './widgets/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                SizedBox(height: size.height * 0.05),
                InputFieldCustom(
                  hintText: 'Enter your email',
                  icon: Icons.email ,
                  onChanged: (value) {},
                ),
                PasswordFieldCustom(
                  hText: 'Enter your password',
                  onChanged: (value) {},
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot password ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedButton(
                  textColor: Colors.black,
                  text: 'SIGN IN',
                  press: () {},
                ),
                const SocialLoginOptions(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SignInButton.socialButtonCircle(
                      facebookColor,
                      FontAwesomeIcons.facebookF,
                      iconColor: Colors.white,
                      onTap: () {},
                    ),
                    SizedBox(width: size.height * 0.03),
                    SignInButton.socialButtonCircle(
                      googleColor,
                      FontAwesomeIcons.googlePlusG,
                      iconColor: Colors.white,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                TextButtonCustom(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
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
