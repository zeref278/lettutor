import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/tutor_provider.dart';
import 'package:lettutor/providers/user_provider.dart';
import 'package:lettutor/services/parser_service.dart';
import 'package:lettutor/ui/courses/course_detail_screen.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ui/processing/processing_screen.dart';
import 'package:lettutor/ui/tutors/feedbacks_screen.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:video_player/video_player.dart';

class TutorDetailScreen extends StatefulWidget {
  final String tutorId;

  const TutorDetailScreen({
    Key? key,
    required this.tutorId,
  }) : super(key: key);

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  bool _isLoading = true;
  late VideoPlayerController _controller;

  @override
  void initState() {
    Provider.of<TutorProvider>(context, listen: false)
        .fetchTutorInfo(widget.tutorId)
        .then((tutor) {
      setState(() {
        _controller = VideoPlayerController.network(tutor.videoLink!)
          ..initialize().then((_) {
            setState(() {});
            _controller.play();
          });
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.only(
                  left: mediumSpacer, right: mediumSpacer, top: mediumSpacer),
              child: Consumer<TutorProvider>(
                builder: (context, tutorData, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomAvatarActive(
                              avatar: Image.network(tutorData.tutor.linkAvatar)
                                  .image,
                              isActive: tutorData.tutor.isActivated,
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
                                    tutorData.tutor.name,
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: smallSpacer,
                                  ),
                                  Row(
                                    children: [
                                      CustomRatingBar(
                                          rating: tutorData.tutor.rating,
                                          onRatingUpdate: (double i) {}),
                                      Text('(${tutorData.tutor.feedbacks!.length})', style: TextStyle(fontSize: 12),)
                                    ],
                                  ),
                                  SizedBox(
                                    height: smallSpacer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: tutorData.tutor.bio.length >= 300
                            ? ExpandableText(
                                tutorData.tutor.bio,
                                trimLines: 4,
                              )
                            : Text(tutorData.tutor.bio),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green[700]))
                            ],
                          ),
                          Column(
                            children: [
                              Consumer<TutorProvider>(
                                builder: (context, tutorData, _) {
                                  return IconButton(
                                      onPressed: () async {
                                        await tutorData.addTutorToFavorite(
                                            tutorId: tutorData.tutor.id);
                                      },
                                      icon: Icon(
                                          tutorData.tutor.isFavorite
                                              ? CupertinoIcons.heart_fill
                                              : CupertinoIcons.heart,
                                          color: Colors.red[700],
                                          size: 30));
                                },
                              ),
                              Text('Favorite',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red[700]))
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.pause();
                                      Navigator.of(context, rootNavigator: true).push(
                                        MaterialPageRoute(builder: (context) => FeedbacksScreen(tutorId: widget.tutorId))
                                      );
                                    });
                                  },
                                  icon: Icon(CupertinoIcons.star,
                                      color: Colors.yellow[700], size: 30)),
                              Text('Review',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.yellow[700]))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const CustomDividerText(
                        child: Text('Introduce',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Stack(
                        children: [
                          _controller.value.isInitialized
                              ? AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller))
                              : Container(),
                          Positioned(
                              bottom: 0,
                              width: MediaQuery.of(context).size.width,
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: false,
                                colors: VideoProgressColors(
                                    backgroundColor: Colors.blueGrey,
                                    bufferedColor: Colors.blueGrey,
                                    playedColor: Colors.blueAccent),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  fixedSize:
                                      MaterialStateProperty.all(Size(30, 30)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)))),
                              onPressed: () {
                                if (_controller.value.position.inSeconds - 10 >
                                    0) {
                                  _controller.seekTo(Duration(
                                      seconds:
                                          _controller.value.position.inSeconds -
                                              10));
                                } else {
                                  _controller.seekTo(Duration(seconds: 0));
                                }
                              },
                              child: Icon(CupertinoIcons.backward_fill)),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: _controller.value.isPlaying
                                    ? MaterialStateProperty.all<Color>(
                                        Colors.redAccent)
                                    : MaterialStateProperty.all<Color>(
                                        Colors.green),
                                fixedSize: MaterialStateProperty.all<Size>(
                                    Size(30, 30)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: () {
                              setState(() {
                                // If the video is playing, pause it.
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  // If the video is paused, play it.
                                  _controller.play();
                                }
                              });
                            },
                            child: Icon(
                              _controller.value.isPlaying
                                  ? CupertinoIcons.pause_solid
                                  : CupertinoIcons.play_arrow_solid,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  fixedSize:
                                      MaterialStateProperty.all(Size(30, 30)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)))),
                              onPressed: () {
                                _controller.seekTo(Duration(
                                    seconds:
                                        _controller.value.position.inSeconds +
                                            10));
                              },
                              child: Icon(CupertinoIcons.forward_fill)),
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
                        children: tutorData.tutor.languages
                            .map((e) => CustomTagTutor(text: Text(e)))
                            .toList(),
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
                        children: tutorData.tutor.specialities
                            .map((e) => CustomTagTutor(text: Text(e)))
                            .toList(),
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
                          tutorData.tutor.experience ?? "",
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
                          tutorData.tutor.interests ?? "",
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
                      (tutorData.tutor.courseIdAndName == null)
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: tutorData.tutor.courseIdAndName!
                                      .map(
                                        (e) => Column(
                                          children: [
                                            CustomTextButton(
                                              onPressed: () {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            CourseDetailScreen(
                                                                courseId: ParserService
                                                                    .parseString(
                                                                        e,
                                                                        ',')[0])));
                                              },
                                              title: Text(
                                                  ParserService.parseString(
                                                      e, ',')[1],
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.blueAccent,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      )
                                      .toList()),
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
                  );
                },
              ),
            ),
    );
  }
}
