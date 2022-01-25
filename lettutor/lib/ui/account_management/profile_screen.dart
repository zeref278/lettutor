import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/ui/account_management/change_password_screen.dart';
import 'package:lettutor/ui/account_management/edit_profile_screen.dart';
import 'package:lettutor/ui/authentication/sign_in_screen.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_signout_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false)
        .fetchUserInfo()
        .then((_) {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: CustomText(LanguageKey.profile,context),
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

              Consumer<UserProvider>(
                builder: (context, userData, _) {
                  return Column(
                    children: [
                      HeaderAccount(),
                      SizedBox(height: 10),
                      SelectableText(
                        'ID: ${userData.user.id}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(
                height: 30,
              ),
              CustomSettingButton(
                text: AppLocalizations.of(context).translate(LanguageKey.your_information),
                width: size.width * 0.9,
                iconData: CupertinoIcons.info_circle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditProfileScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              CustomSettingButton(
                text: AppLocalizations.of(context).translate(LanguageKey.change_password),
                width: size.width * 0.9,
                iconData: CupertinoIcons.padlock_solid,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ChangePasswordScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: size.width * 0.8,
                child: Divider(
                    color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomSettingButton(
                text: AppLocalizations.of(context).translate(LanguageKey.view_feedbacks),
                width: size.width * 0.9,
                iconData: CupertinoIcons.news,
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              CustomSettingButton(
                text: AppLocalizations.of(context).translate(LanguageKey.your_review),
                width: size.width * 0.9,
                iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              CustomSettingButton(
                text: AppLocalizations.of(context).translate(LanguageKey.booked_history),
                width: size.width * 0.9,
                iconData: CupertinoIcons.square_list,
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
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
        ));
  }
}
