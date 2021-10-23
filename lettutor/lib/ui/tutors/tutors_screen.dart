import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_tutor.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: 10,
            ),
            Container(
              width: size.width * 0.9,
              child: CupertinoSearchTextField(
                placeholder: 'Search tutor',
              ),
            ),
            const SizedBox(height: 15),
            CustomCardTutor(
              tutor: myTutor,
            ),
            const SizedBox(height: 15),
            CustomCardTutor(
              tutor: myTutor,
            ),
            const SizedBox(height: 15),
            CustomCardTutor(
              tutor: myTutor,
            ),
          ],
        ),
      ),
    );
  }
}
