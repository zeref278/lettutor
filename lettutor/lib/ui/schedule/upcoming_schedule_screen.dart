import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/services/schedule_service.dart';
import 'package:lettutor/ui/custom_widgets/custom_dialog/dialog_status.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

class UpComingScheduleScreen extends StatefulWidget {
  const UpComingScheduleScreen({Key? key}) : super(key: key);

  @override
  _UpComingScheduleScreenState createState() => _UpComingScheduleScreenState();
}

class _UpComingScheduleScreenState extends State<UpComingScheduleScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    Provider.of<ScheduleProvider>(context, listen: false)
        .fetchUpComingClassed(page: "1", perPage: "1000")
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
              return scheduleData.schedules.isEmpty
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
                          child: CustomText(
                            LanguageKey.you_have_no_upcomming_lesson,
                            context,
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
                        if (index != 0) {
                          firstFlag = false;
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            firstFlag
                                ? CustomDividerText(
                                    child: Text(
                                      scheduleData.schedules[index].date,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  )
                                : SizedBox(
                                    height: 20,
                                  ),
                            CustomCardMeeting(
                              width: size.width * 0.9,
                              date: scheduleData.schedules[index].date,
                              startTime:
                                  scheduleData.schedules[index].startTime,
                              endTime: scheduleData.schedules[index].endTime,
                              onPressedJoinButton: () {
                                ScheduleService.instance.joinMeeting(
                                    scheduleData.schedules[index].meetingLink);
                              },
                              onPressedCancelButton: () async {
                                bool result = await scheduleData
                                    .cancelBookedClasses(scheduleData
                                        .schedules[index].scheduleDetailId);
                                if (result) {
                                  _showDialogWidget(
                                      context,
                                      AppLocalizations.of(context)
                                          .translate(LanguageKey.success),
                                      AppLocalizations.of(context).translate(
                                          LanguageKey.cancel_successful),
                                      BasicDialogStatus.success);
                                } else {
                                  _showDialogWidget(
                                      context,
                                      AppLocalizations.of(context)
                                          .translate(LanguageKey.error),
                                      AppLocalizations.of(context).translate(
                                          LanguageKey.cant_cancel_meeting),
                                      BasicDialogStatus.error);
                                }
                              },
                              avatarLink:
                                  scheduleData.schedules[index].tutorAvatarLink,
                              tutorName:
                                  scheduleData.schedules[index].tutorName,
                            ),
                            flag
                                ? CustomDividerText(
                                    child: Text(
                                      scheduleData.schedules[index + 1].date,
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

  Future<void> _showDialogWidget(
      context, String title, String description, BasicDialogStatus status) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: title,
          description: description,
          status: status,
          onPressMainButton: () {
            Navigator.pop(context);
          },
          onPressSecondaryButton: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
