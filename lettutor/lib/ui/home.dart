import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/schedule_provider.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/services/schedule_service.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

import 'custom_widgets/custom_button/custom_rounded_button.dart';
import 'custom_widgets/custom_button/custom_text_button.dart';
import 'custom_widgets/custom_card/custom_card_tutor.dart';
import 'custom_widgets/custom_text.dart';
import 'meeting/meeting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              width: size.width,
              decoration: const BoxDecoration(
                color: defaultPrimaryColor,
                //borderRadius: BorderRadius.circular(20)
              ),
              child: Consumer<ScheduleProvider>(
                builder: (context, scheduleData, _) {
                  bool flag = scheduleData.schedules.isNotEmpty;
                  bool flag2 = scheduleData.historySchedules.isNotEmpty;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        flag2
                            ? '${AppLocalizations.of(context).translate(LanguageKey.total_lesson_time_is)} ${(scheduleData.getTotalTimeStudied() / 60).floor()} ${AppLocalizations.of(context).translate(LanguageKey.hours)} and ${scheduleData.getTotalTimeStudied() % 60} ${AppLocalizations.of(context).translate(LanguageKey.minutes)}'
                            : AppLocalizations.of(context).translate(
                                LanguageKey.you_havent_studied_lesson_yet),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        flag
                            ? AppLocalizations.of(context)
                                .translate(LanguageKey.upcoming_lesson)
                            : AppLocalizations.of(context).translate(
                                LanguageKey.you_have_no_upcomming_lesson),
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          flag
                              ? '${DateFormat('EEE, dd MMM yy').format(DateTime.parse(scheduleData.schedules[0].date))}, ${scheduleData.schedules[0].startTime} - ${scheduleData.schedules[0].endTime}'
                              : AppLocalizations.of(context)
                                  .translate(LanguageKey.click_below_to_book),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 15,
                      ),
                      CustomRoundedButton(
                        onPressed: flag
                            ? () async {
                                ScheduleService.instance.joinMeeting(
                                    scheduleData.schedules[0].meetingLink);
                              }
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MeetingScreen();
                                    },
                                  ),
                                );
                              },
                        text: flag
                            ? AppLocalizations.of(context)
                                .translate(LanguageKey.enter_lesson_room)
                            : AppLocalizations.of(context)
                                .translate(LanguageKey.book_a_lesson),
                        color: Colors.white,
                        textColor: Colors.black,
                        width: size.width * 0.7,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: largeSpacer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomText(
                  LanguageKey.recommended_tutors,
                  context,
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
                mediumHorizontalSpacer,
                CustomTextButton(
                  onPressed: () {},
                  title: CustomText(
                    LanguageKey.see_all, context,
                    style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Consumer<TutorProvider>(
                builder: (context, tutorData, _) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: tutorData.tutors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CustomCardTutor(
                              tutorId: tutorData.tutors[index].id,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
