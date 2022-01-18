import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';

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
  void initState() {
    isFavorite = widget.tutor.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: Text('Tutor Detail'),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        backgroundColor: defaultPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: mediumSpacer, right: mediumSpacer, top: mediumSpacer),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAvatarActive(
                    avatar: Image.network(widget.tutor.linkAvatar).image,
                    isActive: widget.tutor.isActivated,
                    avatarSize: 35,
                  ),
                  SizedBox(
                    width: mediumSpacer,
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
                          height: smallSpacer,
                        ),
                        CustomRatingBar(
                            rating: widget.tutor.rating,
                            onRatingUpdate: (double i) {}),
                        SizedBox(
                          height: smallSpacer,
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
                widget.tutor.bio,
                trimLines: 4,
              ),
            ),
            SizedBox(height: mediumSpacer),
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
                    Text('Message',
                        style:
                            TextStyle(fontSize: 16, color: Colors.green[700]))
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
                    Text('Favorite',
                        style: TextStyle(fontSize: 16, color: Colors.red[700]))
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
                    Text('Report',
                        style: TextStyle(fontSize: 16, color: Colors.black))
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
                    Text('Review',
                        style:
                            TextStyle(fontSize: 16, color: Colors.yellow[700]))
                  ],
                )
              ],
            ),
            SizedBox(height: mediumSpacer),
            const CustomDividerText(
              child: Text('Language',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: mediumSpacer),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                CustomTagTutor(text: Text('English')),
                CustomTagTutor(text: Text('Tagalog')),
              ],
            ),
            SizedBox(height: mediumSpacer),
            const CustomDividerText(
              child: Text('Specialties',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: mediumSpacer),
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
            SizedBox(height: mediumSpacer),
            const CustomDividerText(
              child: Text('Teaching experience',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              child: Text(
                widget.tutor.experience ?? "",
              ),
            ),
            SizedBox(height: mediumSpacer),
            const CustomDividerText(
              child: Text('Interests',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            Container(
              child: Text(
                widget.tutor.interests ?? "",
              ),
            ),
            SizedBox(height: mediumSpacer),
            CustomDividerText(
              child: const Text('Suggested courses',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: mediumSpacer),
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
                  SizedBox(height: mediumSpacer),
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
            SizedBox(height: mediumSpacer),
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
