import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

class HeaderAccountSetting extends StatelessWidget {
  const HeaderAccountSetting({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userData, _) {
        return Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: Image.network(userData.user.linkAvatar).image,
            ),
            Text(
              userData.user.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              userData.user.email,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),


          ],
        );
      },
    );
  }

}