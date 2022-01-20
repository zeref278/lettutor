import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ui/tutors/feedbacks_screen.dart';
import 'package:provider/provider.dart';

class HistoryScheduleScreen extends StatefulWidget {
  const HistoryScheduleScreen({Key? key}) : super(key: key);

  @override
  _HistoryScheduleScreenState createState() => _HistoryScheduleScreenState();
}

class _HistoryScheduleScreenState extends State<HistoryScheduleScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<ScheduleProvider>(context, listen: false)
        .fetchStudiedClassed(page: "1", perPage: "1000")
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Consumer<ScheduleProvider>(
            builder: (context, scheduleData, _) {
              return scheduleData.historySchedules.isEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Icon(CupertinoIcons.book,
                            color: Colors.black, size: 30),
                        SizedBox(width: 10),
                        Container(
                          child: Text(
                            "You haven't studied yet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
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
                        if (index != 0) {
                          firstFlag = false;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            firstFlag
                                ? CustomDividerText(
                                    child: Text(
                                      scheduleData
                                          .historySchedules[index + 1].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  )
                                : SizedBox(
                                    height: 20,
                                  ),
                            CustomCardMeetingHistory(
                              width: size.width * 0.9,
                              date: scheduleData.historySchedules[index].date,
                              startTime: scheduleData
                                  .historySchedules[index].startTime,
                              endTime:
                                  scheduleData.historySchedules[index].endTime,
                              avatarLink: scheduleData
                                  .historySchedules[index].tutorAvatarLink,
                              tutorName: scheduleData
                                  .historySchedules[index].tutorName,
                              onPressedReviewButton: () {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => FeedbacksScreen(
                                            tutorId: scheduleData
                                                .historySchedules[index]
                                                .tutorId)));
                              },
                              onPressedRecordButton: () {},
                            ),
                            flag
                                ? CustomDividerText(
                                    child: Text(
                                      scheduleData
                                          .historySchedules[index + 1].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
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
