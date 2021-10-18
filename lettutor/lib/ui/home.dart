import 'package:flutter/material.dart';
import 'package:lettutor/themes/custom_colors.dart';

import 'custom_widgets/custom_button/custom_rounded_button.dart';
import 'custom_widgets/custom_button/custom_text_button.dart';
import 'custom_widgets/custom_card/custom_card_tutor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                color: defaultColor,
                //borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Total lesson time is 100 hours and 30 minutes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Up comming Lesson',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Text('Fri, 15 Oct 21 6:30 - 7:30',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600)),
                  CustomRoundedButton(
                    press: () {},
                    text: 'Enter lesson room',
                    color: Colors.white,
                    textColor: Colors.black,
                    width: size.width * 0.5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'Recommended Tutors',
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -5))
                    ],
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 1.5,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                CustomTextButton(
                  onPressed: () {},
                  title: const Text(
                    'See all',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomCardTutor(),
            const SizedBox(height: 15),
            CustomCardTutor(),
            const SizedBox(height: 15),
            CustomCardTutor(),
            const SizedBox(height: 15),
            CustomCardTutor(),
          ],
        ),
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
