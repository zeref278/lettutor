import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

class HeaderAccount extends StatelessWidget {
  const HeaderAccount({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userData, _) {
        return Column(
          children: [
            Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.network(userData.user.linkAvatar).image,
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
              userData.user.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              userData.user.email,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),

          ],
        );
      },
    );
  }

}