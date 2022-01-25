import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/services/parser_service.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:lettutor/ui/tutors/tutor_detail_screen.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';
import 'package:provider/provider.dart';

import 'ebook_view_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({Key? key, required this.courseId})
      : super(key: key);
  final String courseId;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<CourseProvider>(context, listen: false)
        .fetchCourse(widget.courseId)
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: AppBar(
        title: CustomText(LanguageKey.course_detail, context),
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
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Consumer<CourseProvider>(
                builder: (context, courseData, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: Image.network(courseData.course.linkImageCover)
                              .image,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        courseData.course.name,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                      CustomDividerText(
                        child: CustomText(LanguageKey.overview, context,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.question_square,
                            color: Colors.red[700],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            LanguageKey.why_take_this_course,
                            context,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        courseData.course.reason,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.question_square,
                            color: Colors.red[700],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomText(
                            LanguageKey.what_will_you_be_able_to_do,
                            context,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        courseData.course.purpose,
                      ),
                      CustomDividerText(
                        child: CustomText(LanguageKey.experience_level, context,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.person_badge_plus,
                            color: Colors.blue[700],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            ParserService.parseLevel(courseData.course.level),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      CustomDividerText(
                        child: CustomText(LanguageKey.course_length, context,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.checkmark_square,
                            color: Colors.green[700],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${courseData.course.listTopic!.length} ${AppLocalizations.of(context).translate(LanguageKey.topics)}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      CustomDividerText(
                        child: CustomText(LanguageKey.list_topics,
                            context,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: courseData.course.listTopic!.length,
                          itemBuilder: (context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                EbookViewScreen(
                                                  pdfUrl: courseData
                                                      .course
                                                      .listTopic![index]
                                                      .linkFile,
                                                )));
                                  },
                                  title: Text(
                                    '${index + 1}. ${courseData.course.listTopic![index].name}',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          }),
                       CustomDividerText(
                        child: CustomText(LanguageKey.tutors,
                            context,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: courseData.course.tutorsName!.length,
                          itemBuilder: (context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons
                                          .person_crop_circle_badge_checkmark,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTextButton(
                                      title: Text(
                                        courseData.course.tutorsName![index],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    TutorDetailScreen(
                                                        tutorId: courseData
                                                                .course
                                                                .tutorsId![
                                                            index])));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
