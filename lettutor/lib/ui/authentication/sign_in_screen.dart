import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lettutor/ui/authentication/sign_up_screen.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_input_field.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_fields/custom_password_field.dart';
import '../custom_widgets/custom_button/social_login_options.dart';
import '../custom_widgets/custom_button/custom_social_button.dart';

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
                icon: Icons.email,
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
              CustomRoundedButton(
                width: size.width * 0.9,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don't have an account ? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    title: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: darkYellow, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}