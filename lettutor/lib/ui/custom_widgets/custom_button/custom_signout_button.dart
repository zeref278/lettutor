import 'package:flutter/material.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/ui/authentication/sign_in_screen.dart';

import 'custom_rounded_button.dart';

class SignOutButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomRoundedButton(
      width: size.width * 0.9,
      textColor: Colors.black,
      text: 'SIGN OUT',
      onPressed: () {
        AuthServices authService = AuthServices.instance;
        authService.signOut();
        Navigator.of(context)
            .pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => SignInScreen()
          ),
              (_) => false,
        );
      },
    );
  }

}