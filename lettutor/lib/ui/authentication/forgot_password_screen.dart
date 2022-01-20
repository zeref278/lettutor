import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/services/auth_services.dart';
import 'package:lettutor/services/validator_service.dart';
import 'package:lettutor/themes/name_logo.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

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
        title: Text('Forgot Password'),
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
              const Text(
                "We'll send you a link to reset your password",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              CustomInputField(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              SizedBox(height: size.height * 0.1),
              CustomRoundedButton(
                width: size.width * 0.9,
                textColor: Colors.black,
                text: 'SEND',
                onPressed: () async {
                  bool flagEmail = ValidatorService.validateEmail(_emailController.text);

                  if(flagEmail) {
                    bool result = await  AuthServices.instance.forgotPassword(
                        _emailController.text);
                    if (result) {
                      _showDialogWidget(context, 'Success', 'Email sent !', BasicDialogStatus.success);
                    } else {
                      _showDialogWidget(context, 'Error', 'Cant send email !', BasicDialogStatus.error);
                    }
                  } else {
                    _showDialogWidget(context, 'Error', 'Email invalid', BasicDialogStatus.warning);
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
