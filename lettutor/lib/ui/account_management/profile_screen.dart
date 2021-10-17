import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_setting_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: size.width,
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(CupertinoIcons.camera_on_rectangle),
                    ),
                  )
                ],
              ),
              Text(
                'Duy Truong',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text(
                'tnduy.dev@gmail.com',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 10),
              SelectableText(
                'ID: 7ea4ab66-d029-4e7b-8898-8534a1a80d7a',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              CustomSettingButton(
                text: 'Your information',
                width: size.width * 0.9,
                iconData: CupertinoIcons.info_circle,
                onPressed: () {},
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
                text: 'View feedback',
                width: size.width * 0.9,
                iconData: CupertinoIcons.news,
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              CustomSettingButton(
                text: 'Your Review',
                width: size.width * 0.9,
                iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                onPressed: () {},
              ),
              SizedBox(
                height: 12,
              ),
              CustomSettingButton(
                text: 'Booking History',
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
                text: 'SIGN OUT',
                press: () {},
              ),
            ],
          ),
        ));
  }
}
