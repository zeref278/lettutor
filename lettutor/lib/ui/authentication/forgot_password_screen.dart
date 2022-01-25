import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/services/validator_service.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';

import '../custom_widgets/custom_dialog/custom_alert_dialog.dart';
import '../custom_widgets/custom_dialog/dialog_status.dart';

class ForgotPasswordScreen extends StatefulWidget {

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: CustomText(LanguageKey.forgot_password, context),
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
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const NameLogo(),
              SizedBox(height: 50),
              CustomText(
                LanguageKey.long_text_forgot_password,
                context,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              CustomInputField(
                textEditingController: _emailController,
                hintText: AppLocalizations.of(context).translate(LanguageKey.login_et_user_email),
                icon: Icons.email,
              ),
              SizedBox(height: size.height * 0.1),
              CustomRoundedButton(
                width: size.width * 0.9,
                textColor: Colors.black,
                text: AppLocalizations.of(context).translate(LanguageKey.send),
                onPressed: () async {
                  bool flagEmail = ValidatorService.validateEmail(_emailController.text);

                  if(flagEmail) {
                    bool result = await  AuthServices.instance.forgotPassword(
                        _emailController.text);
                    if (result) {
                      _showDialogWidget(context, AppLocalizations.of(context).translate(LanguageKey.success), AppLocalizations.of(context).translate(LanguageKey.email_sent), BasicDialogStatus.success);
                    } else {
                      _showDialogWidget(context, AppLocalizations.of(context).translate(LanguageKey.error), AppLocalizations.of(context).translate(LanguageKey.cant_send_email), BasicDialogStatus.error);

                    }
                  } else {
                    _showDialogWidget(context, AppLocalizations.of(context).translate(LanguageKey.error), AppLocalizations.of(context).translate(LanguageKey.email_invalid), BasicDialogStatus.error);

                  }
                },
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
