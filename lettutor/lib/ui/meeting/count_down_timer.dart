import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lettutor/constants/ui_constants.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    required this.timeStart,
  }) : super(key: key);

  final String timeStart;

  @override
  State<StatefulWidget> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  Duration duration = Duration();
  Timer? timer;

  void startTimer() {
    if (mounted) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
    }
  }

  void addTime() {
    if (mounted) {
      const addSeconds = -1;
      setState(() {
        final seconds = duration.inSeconds + addSeconds;

        if (seconds < 0) {
          timer!.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    duration = DateTime.parse(widget.timeStart).difference(DateTime.now());
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Lesson will be started after',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: defaultPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '$hours',
                style: TextStyle(
                    fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Text(':',
                style: TextStyle(
                  fontSize: 50,
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: defaultPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '$minutes',
                style: TextStyle(
                    fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Text(':',
                style: TextStyle(
                  fontSize: 50,
                )),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: defaultPrimaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                '$seconds',
                style: TextStyle(
                    fontSize: 50, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
