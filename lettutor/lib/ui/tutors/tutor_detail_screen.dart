import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_divider/custom_divider_text.dart';
import 'package:lettutor/ui/custom_widgets/custom_tag/custom_tag_tutor.dart';
import 'package:lettutor/ui/custom_widgets/custom_text/expandable_text.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorDetailScreen extends StatefulWidget {
  final Tutor tutor;

  const TutorDetailScreen({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 0.12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(widget.tutor.linkAvatar),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.tutor.name,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 16,
                              color: defaultColor,
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 16,
                              color: defaultColor,
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 16,
                              color: defaultColor,
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 16,
                              color: defaultColor,
                            ),
                            Icon(
                              CupertinoIcons.star_fill,
                              size: 16,
                              color: defaultColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Viet Nam'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ExpandableText(
                widget.tutor.description,
                trimLines: 4,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(CupertinoIcons.bubble_left,
                            color: Colors.green[700], size: 30)),
                    Text('Message', style: TextStyle(fontSize: 16, color: Colors.green[700]))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                            isFavorite
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart,
                            color: Colors.red[700],
                            size: 30)),
                    Text('Favorite', style: TextStyle(fontSize: 16, color: Colors.red[700]))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(CupertinoIcons.info_circle,
                            color: Colors.black, size: 30)),
                    Text('Report', style: TextStyle(fontSize: 16, color: Colors.black))
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(CupertinoIcons.star,
                            color: Colors.yellow[700], size: 30)),
                    Text('Review', style: TextStyle(fontSize: 16, color: Colors.yellow[700]))
                  ],
                )
              ],
            ),
            SizedBox(height: 15),
            const CustomDividerText(
              child: Text('Introduce',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 15),
            const CustomDividerText(
              child: Text('Language',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                CustomTagTutor(text: Text('English')),
                CustomTagTutor(text: Text('Tagalog')),
              ],
            ),
            SizedBox(height: 15),
            const CustomDividerText(
              child: Text('Specialties',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                CustomTagTutor(text: Text('English for Business')),
                CustomTagTutor(text: Text('Conversational')),
                CustomTagTutor(text: Text('Tagalog')),
                CustomTagTutor(text: Text('Tagalog')),
              ],
            ),
            SizedBox(height: 15),
            CustomDividerText(
              child: const Text('Suggested courses',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text('Business English: ',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      CustomTextButton(
                        onPressed: () {},
                        title: Text(
                          'link',
                          style:
                              TextStyle(fontSize: 17, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Conversation: ',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      CustomTextButton(
                        onPressed: () {},
                        title: Text(
                          'link',
                          style:
                              TextStyle(fontSize: 17, color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            const CustomDividerText(
              child: Text('Booking',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SfCalendar(
              showNavigationArrow: true,
              firstDayOfWeek: 1,
              view: CalendarView.week,
            ),
          ],
        ),
      ),
    );
  }
}
