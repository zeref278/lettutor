

import 'package:flutter/material.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class HistoryScheduleScreen extends StatefulWidget {
  const HistoryScheduleScreen({Key? key}) : super(key: key);

  @override
  _HistoryScheduleScreenState createState() => _HistoryScheduleScreenState();
}

class _HistoryScheduleScreenState extends State<HistoryScheduleScreen> {

  @override
  void initState() {
    // Provider.of<ScheduleProvider>(context, listen: false)
    //     .fetchStudiedClassed(page: "1", perPage: "1000")
    //     .then((_) {
    //   setState(() {
    //     //_isLoading = false;
    //   });
    // });
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
            itemCount: scheduleData.historySchedules.length,
            itemBuilder: (context, int index) {
              bool flag = false;
              bool firstFlag = true;
              if (index + 1 < scheduleData.historySchedules.length) {
                if (scheduleData.historySchedules[index].date !=
                    scheduleData.historySchedules[index + 1].date) {
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
                      scheduleData.historySchedules[index + 1].date,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  )
                      : SizedBox(height: 20,),
                  CustomCardMeeting(
                    width: size.width * 0.9,
                    date: scheduleData.historySchedules[index].date,
                    startTime: scheduleData.historySchedules[index].startTime,
                    endTime: scheduleData.historySchedules[index].endTime,
                    isBegin: false,
                    onPressedSecondButton: () {},
                    onPressedFirstButton: () {},
                    avatarLink:
                    scheduleData.historySchedules[index].tutorAvatarLink,
                    tutorName: scheduleData.historySchedules[index].tutorName,
                  ),
                  flag
                      ? CustomDividerText(
                    child: Text(
                      scheduleData.historySchedules[index + 1].date,
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
