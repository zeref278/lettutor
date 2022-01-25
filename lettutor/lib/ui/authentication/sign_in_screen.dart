import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/services/validator_service.dart';
import 'package:lettutor/ui/authentication/forgot_password_screen.dart';

import 'package:lettutor/ui/authentication/sign_up_screen.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_dialog/custom_alert_dialog.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ui/home_screen/home_nav.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';

import '../custom_widgets/custom_dialog/dialog_status.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int _result = -1;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    AuthServices.instance.checkAlreadySignin().then((result) {
      if (result == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage();
            },
          ),
        );
      } else if (result == 0) {
      } else {}
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const NameLogo(),
              SizedBox(height: size.height * 0.05),
              CustomInputField(
                textEditingController: _emailController,
                hintText: AppLocalizations.of(context)
                    .translate(LanguageKey.login_et_user_email),
                icon: Icons.email,
              ),
              CustomPasswordField(
                textEditingController: _passwordController,
                hText: AppLocalizations.of(context)
                    .translate(LanguageKey.login_et_user_password),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordScreen();
                        },
                      ),
                    );
                  },
                  child: CustomText(
                    LanguageKey.forgot_password,
                    context,
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
                text: AppLocalizations.of(context)
                    .translate(LanguageKey.login_btn_sign_in),
                onPressed: () async {
                  bool flagEmail =
                      ValidatorService.validateEmail(_emailController.text);
                  bool flagPass = ValidatorService.validatePassword(
                      _passwordController.text);

                  if (flagEmail && flagPass) {
                    bool result = await AuthServices.instance.signInService(
                        _emailController.text, _passwordController.text);
                    if (result) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyHomePage();
                          },
                        ),
                      );
                    } else {
                      _showDialogWidget(
                          context,
                          AppLocalizations.of(context)
                              .translate(LanguageKey.error),
                          AppLocalizations.of(context)
                              .translate(LanguageKey.login_unsuccessful),
                          BasicDialogStatus.error);
                    }
                  } else {
                    _showDialogWidget(
                        context,
                        AppLocalizations.of(context)
                            .translate(LanguageKey.error),
                        AppLocalizations.of(context).translate(
                            LanguageKey.email_or_password_is_invalid),
                        BasicDialogStatus.warning);
                  }
                },
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
                  CustomText(
                    LanguageKey.dont_have_an_account,
                    context,
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
                    title: CustomText(
                      LanguageKey.sign_up,
                      context,
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

  Future<void> _showDialogWidget(
      context, String title, String description, BasicDialogStatus status) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title,
          description: description,
          status: status,
          onPressMainButton: () {
            Navigator.pop(context);
          },
          onPressSecondaryButton: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
