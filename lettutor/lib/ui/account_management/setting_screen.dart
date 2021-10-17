
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_setting_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
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
              onPressed: () {},
            ),
            SizedBox(height: 12),
            CustomSettingButton(
              text: 'Dark Mode',
              width: size.width * 0.9,
              iconData: CupertinoIcons.moon,
              onPressed: () {},
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
