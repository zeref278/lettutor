import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
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
          title: Text('Change Password'),
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
                hText: "Enter old password",
              ),
              CustomPasswordField(
                textEditingController: controllerNewPassword,
                hText: "Enter new password",
              ),
              CustomPasswordField(
                textEditingController: controllerConfirmPassword,
                hText: "Confirm new password",
              ),
              Consumer<UserProvider>(
                builder: (context, userData, _) {
                  return CustomRoundedButton(
                    text: "SAVE",
                    onPressed: () {
                      userData.changePassword(controllerOldPassword.text, controllerOldPassword.text);
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
}
