import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_feedback.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_tutor.dart';

class FeedbacksScreen extends StatelessWidget {
  const FeedbacksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: 10,
            ),
            const SizedBox(height: 15),
            CustomCardFeedback(
              tutor: myTutor,
              countStars: 5,
              feedbacks: 'Good .................................................aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            ),
            const SizedBox(height: 15),
            CustomCardFeedback(
              tutor: myTutor,
              countStars: 5,
              feedbacks: 'Good .................................................',
            ),
            const SizedBox(height: 15),
            CustomCardFeedback(
              tutor: myTutor,
              countStars: 5,
              feedbacks: 'Good .................................................',
            ),
          ],
        ),
      ),
    );
  }
}
