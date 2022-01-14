import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: mediumSpacer, right: mediumSpacer),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mediumSpacer,
            ),
            CupertinoSearchTextField(
              placeholder: 'Search tutor',
            ),
            const SizedBox(height: mediumSpacer),
            CustomCardTutor(
              tutor: myTutor,
            ),
            const SizedBox(height: mediumSpacer),
            CustomCardTutor(
              tutor: myTutor,
            ),
            const SizedBox(height: mediumSpacer),
            CustomCardTutor(
              tutor: myTutor,
            ),
          ],
        ),
      ),
    );
  }
}
