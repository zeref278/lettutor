import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/ui/authentication/sign_in_screen.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: CustomText(LanguageKey.sign_up, context),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        backgroundColor: defaultPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const NameLogo(),
              SizedBox(height: size.height * 0.03),
              CustomInputField(
                hintText: AppLocalizations.of(context).translate(LanguageKey.username),
              ),
              CustomInputField(
                icon: Icons.email,
                hintText: AppLocalizations.of(context).translate(LanguageKey.login_et_user_email),
              ),
              CustomPasswordField(
                hText: AppLocalizations.of(context).translate(LanguageKey.login_et_user_password),
              ),
              CustomPasswordField(
                hText: AppLocalizations.of(context).translate(LanguageKey.login_et_confirm_password),
              ),
              SizedBox(height: size.height * 0.03),
              CustomRoundedButton(
                width: size.width * 0.9,
                textColor: Colors.black,
                text: AppLocalizations.of(context).translate(LanguageKey.login_btn_sign_up),
                onPressed: () {},
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   CustomText(
                    LanguageKey.already_have_an_account,
                    context,
                    style: TextStyle(color: Colors.black),
                  ),
                  CustomTextButton(
                    title:  CustomText(
                      LanguageKey.login,
                      context,
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
