import 'package:flutter/material.dart';

import 'count_down_timer.dart';

class MeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CountDownTimer(
          timeStart: "2021-10-19 18:00:00",
        ),
      ),
    );
  }

}