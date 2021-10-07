import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/screens/login_screen/sign_in.dart';
import 'package:lettutor/screens/login_screen/widgets/name_logo.dart';
import 'package:lettutor/themes/custom_colors.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:  <Widget>[
            const NameLogo(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignInScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: defaultColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
              ),
            )

            )
          ],
        ),
      ),
    );
  }

}