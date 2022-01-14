import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  late TextEditingController controllerName;
  late TextEditingController controllerPhone;
  late TextEditingController controllerDate;
  late TextEditingController controllerAddress;

  @override
  initState(){
    super.initState();

    controllerName = TextEditingController();
    controllerPhone = TextEditingController();
  }

  @override
  void dispose() {

    controllerName.dispose();
    controllerPhone.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        appBar: AppBar(
          title: Text('Edit Profile'),
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
        floatingActionButton: FloatingActionButton(
          onPressed: _SaveButtonPressed(),
          elevation: 5,
          child: Icon(CupertinoIcons.checkmark_alt),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

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

              SizedBox(
                height: 30,
              ),
              CustomInputField(hintText: "Duy Truong"),
              CustomInputField(hintText: "0123456", icon: CupertinoIcons.phone,),
              CustomInputField(hintText: "0123456", icon: CupertinoIcons.phone,),


            ],
          ),
        ));
  }

  _SaveButtonPressed() {

  }
}
