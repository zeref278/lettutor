import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_dialog/dialog_status.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController controllerOldPassword;
  late TextEditingController controllerNewPassword;
  late TextEditingController controllerConfirmPassword;

  @override
  initState() {
    super.initState();

    controllerNewPassword = TextEditingController();
    controllerOldPassword = TextEditingController();
    controllerConfirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    controllerNewPassword.dispose();
    controllerOldPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: CustomText(LanguageKey.change_password, context),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: size.width,
                height: 30,
              ),
              HeaderAccount(),
              SizedBox(
                height: 30,
              ),
              CustomPasswordField(
                textEditingController: controllerOldPassword,
                hText: AppLocalizations.of(context).translate(LanguageKey.enter_old_password),
              ),
              CustomPasswordField(
                textEditingController: controllerNewPassword,
                hText: AppLocalizations.of(context).translate(LanguageKey.enter_new_password),
              ),
              CustomPasswordField(
                textEditingController: controllerConfirmPassword,
                hText: AppLocalizations.of(context).translate(LanguageKey.confirm_new_password),
              ),
              Consumer<UserProvider>(
                builder: (context, userData, _) {
                  return CustomRoundedButton(
                    text: AppLocalizations.of(context).translate(LanguageKey.save),
                    onPressed: ()  async {
                      bool result =  await userData.changePassword(controllerOldPassword.text, controllerOldPassword.text);

                      if (result) {
                        _showDialogWidget(
                            context,
                            AppLocalizations.of(context)
                                .translate(LanguageKey.success),
                            AppLocalizations.of(context).translate(
                                LanguageKey.change_password_successful),
                            BasicDialogStatus.success);
                      } else {
                        _showDialogWidget(
                            context,
                            AppLocalizations.of(context)
                                .translate(LanguageKey.error),
                            AppLocalizations.of(context).translate(
                                LanguageKey.change_password_unsuccessful),
                            BasicDialogStatus.error);
                      }
                    },
                    width: size.width * 0.5,
                    textColor: Colors.black,
                  );
                },
              ),

            ],
          ),
        ));
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
