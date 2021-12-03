import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_setting_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:country_icons/country_icons.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Text('Setting'),
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
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            Text(
              'Duy Truong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              'tnduy.dev@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            CustomSettingButton(
              text: 'Language',
              width: size.width * 0.9,
              iconData: FontAwesomeIcons.language,
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        title: Text('Select language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: [
                                Image.asset('assets/flags/vn.png',
                                    width: 50.0, height: 30.0),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Tiếng Việt',
                                      style: TextStyle(fontSize: 18),
                                    )),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/flags/gb.png',
                                    width: 50.0, height: 30.0),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('English',
                                        style: TextStyle(fontSize: 18))),
                              ],
                            ),
                          ],
                        ),
                        actions: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "CANCEL",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        ],
                      );
                    });
              },
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Dark Mode',
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
                        title: Text('Dark Mode'),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Off '),
                            CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {},
                            ),
                            Text('On '),
                          ],
                        ),
                        actions: [
                          MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        ],
                      );
                    });
              },
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Advanced Setting',
              width: size.width * 0.9,
              iconData: CupertinoIcons.gear_alt,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Report Bug',
              width: size.width * 0.9,
              iconData: FontAwesomeIcons.bug,
              onPressed: () {},
            ),
            SizedBox(height: 30),
            CustomSettingButton(
              text: 'Help',
              width: size.width * 0.9,
              iconData: CupertinoIcons.question_square,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Our website',
              width: size.width * 0.9,
              iconData: CupertinoIcons.globe,
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Contact',
              width: size.width * 0.9,
              iconData: CupertinoIcons.person_3,
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Text(
              'Version: 1.0.0',
            ),
            CustomRoundedButton(
              width: size.width * 0.9,
              textColor: Colors.black,
              text: 'SIGN OUT',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
