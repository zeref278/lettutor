import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_dialog/dialog_status.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  late TextEditingController controllerName;
  late TextEditingController controllerCountry;
  late TextEditingController controllerDate;

  @override
  initState() {
    super.initState();

    Provider.of<UserProvider>(context, listen: false)
        .fetchUserInfo()
        .then((_) {
      setState(() {

      });
    });
    controllerName = TextEditingController();
    controllerCountry = TextEditingController();
    controllerDate = TextEditingController();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerCountry.dispose();
    controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: CustomText(LanguageKey.edit_profile, context),
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
        floatingActionButton:
            Consumer<UserProvider>(builder: (context, userData, _) {
          return FloatingActionButton(
            onPressed: () async {
              bool result = await userData.changeInformation(
                  name: controllerName.text,
                  country: controllerCountry.text,
                  dateOfBirth: controllerDate.text);

              if (result) {
                _showDialogWidget(
                    context,
                    AppLocalizations.of(context)
                        .translate(LanguageKey.success),
                    AppLocalizations.of(context).translate(
                        LanguageKey.change_profile_successful),
                    BasicDialogStatus.success);
              } else {
                _showDialogWidget(
                    context,
                    AppLocalizations.of(context)
                        .translate(LanguageKey.error),
                    AppLocalizations.of(context).translate(
                        LanguageKey.change_profile_unsuccessful),
                    BasicDialogStatus.error);
              }
            },
            elevation: 5,
            child: Icon(CupertinoIcons.checkmark_alt),
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        }),
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
                      SizedBox(
                        height: 30,
                      ),
                      CustomInputField(
                          textEditingController: controllerName,
                          hintText: userData.user.name),
                      CustomInputField(
                        textEditingController: controllerCountry,
                        hintText: userData.user.country ?? "",
                        icon: CupertinoIcons.location,
                      ),
                      CustomInputField(
                        textEditingController: controllerDate,
                        hintText: userData.user.birthday,
                        icon: CupertinoIcons.calendar,
                      ),
                    ],
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
