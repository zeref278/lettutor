import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_rounded_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_setting_button.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: Text('Profile'),
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
                        color: defaultPrimaryColor,
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
