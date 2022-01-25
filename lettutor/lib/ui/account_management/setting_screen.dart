import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/services/language_service.dart';
import 'package:lettutor/ui/authentication/sign_in_screen.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/src/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {


  Future<void> showDialogLanguage(context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return LanguageDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: CustomText(LanguageKey.setting, context),
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
          children: <Widget>[
            SizedBox(
              height: 10,
              width: size.width,
            ),
            HeaderAccountSetting(),
            SizedBox(
              height: 30,
            ),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.home_tv_choose_language),
              width: size.width * 0.9,
              iconData: FontAwesomeIcons.language,
              onPressed: () {
                showDialogLanguage(context);
              },
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.dark_mode),
              width: size.width * 0.9,
              iconData: CupertinoIcons.moon,
              onPressed: () {
                var _switchValue = false;
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        title: CustomText(LanguageKey.dark_mode, context),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(LanguageKey.off, context),
                            CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {},
                            ),
                            CustomText(LanguageKey.on, context),
                          ],
                        ),
                        
                      );
                    });
              },
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.advanced_setting),
              width: size.width * 0.9,
              iconData: CupertinoIcons.gear_alt,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.report_bug),
              width: size.width * 0.9,
              iconData: FontAwesomeIcons.bug,
              onPressed: () {},
            ),
            SizedBox(height: 30),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.help),
              width: size.width * 0.9,
              iconData: CupertinoIcons.question_square,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.our_website),
              width: size.width * 0.9,
              iconData: CupertinoIcons.globe,
              onPressed: () {},
            ),

            SizedBox(height: 12),
            CustomSettingButton(
              text: AppLocalizations.of(context).translate(LanguageKey.contact),
              width: size.width * 0.9,
              iconData: CupertinoIcons.person_3,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Text(
              AppLocalizations.of(context).translate(LanguageKey.contact) +': 1.0.0',
            ),
            CustomRoundedButton(
              width: size.width * 0.9,
              textColor: Colors.black,
              text: AppLocalizations.of(context).translate(LanguageKey.login_btn_sign_out),
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
            ),
          ],
        ),
      ),
    );
  }
}
