

import 'package:flutter/material.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class UpComingScheduleScreen extends StatefulWidget {
  const UpComingScheduleScreen({Key? key}) : super(key: key);

  @override
  _UpComingScheduleScreenState createState() => _UpComingScheduleScreenState();
}

class _UpComingScheduleScreenState extends State<UpComingScheduleScreen> {

  @override
  void initState() {
    Provider.of<ScheduleProvider>(context, listen: false)
        .fetchUpComingClassed(page: "1", perPage: "1000")
        .then((_) {
      setState(() {
        //_isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<ScheduleProvider>(
      builder: (context, scheduleData, _) {
        return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: scheduleData.schedules.length,
            itemBuilder: (context, int index) {
              bool flag = false;
              bool firstFlag = true;
              if (index + 1 < scheduleData.schedules.length) {
                if (scheduleData.schedules[index].date !=
                    scheduleData.schedules[index + 1].date) {
                  flag = true;
                }
              }
              if(index != 0) {
                firstFlag = false;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  firstFlag ? CustomDividerText(
                    child: Text(
                      scheduleData.schedules[index + 1].date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                      : SizedBox(height: 20,),
                  CustomCardMeeting(
                    width: size.width * 0.9,
                    date: scheduleData.schedules[index].date,
                    startTime: scheduleData.schedules[index].startTime,
                    endTime: scheduleData.schedules[index].endTime,
                    isBegin: true,
                    onPressedSecondButton: () {},
                    onPressedFirstButton: () {},
                    avatarLink:
                    scheduleData.schedules[index].tutorAvatarLink,
                    tutorName: scheduleData.schedules[index].tutorName,
                  ),
                  flag
                      ? CustomDividerText(
                    child: Text(
                      scheduleData.schedules[index + 1].date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                      : Container(),
                ],
              );
            });
      },
    );
  }
}
