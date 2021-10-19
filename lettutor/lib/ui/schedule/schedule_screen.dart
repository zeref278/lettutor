import 'package:flutter/material.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_meeting.dart';
import 'package:lettutor/models/hard_code.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: 20,
            ),
            CustomCardMeeting(
              width: size.width * 0.9,
              tutor: myTutor,
              date: '2021-10-19',
              startTime: '06:30',
              endTime: '09:30',
              isBegin: true,
              onPressedSecondButton: () {},
              onPressedFirstButton: () {},
            ),
            SizedBox(height: 20,),
            CustomCardMeeting(
              width: size.width * 0.9,
              tutor: myTutor,
              date: '2021-10-20',
              startTime: '06:30',
              endTime: '09:30',
              isBegin: false,
              onPressedSecondButton: () {},
              onPressedFirstButton: () {},
            ),
            SizedBox(height: 20,),
            CustomCardMeeting(
              width: size.width * 0.9,
              tutor: myTutor,
              date: '2021-10-21',
              startTime: '06:30',
              endTime: '09:30',
              isBegin: false,
              onPressedSecondButton: () {},
              onPressedFirstButton: () {},
            ),
          ],
        ),
      ),
    );
  }
}
