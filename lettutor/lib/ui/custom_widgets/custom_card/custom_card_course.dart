import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/services/parser_service.dart';
import 'package:lettutor/ui/courses/course_detail_screen.dart';
import 'package:lettutor/ultis/language_keys.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';

class CustomCardCourse extends StatelessWidget {
  final double width;
  final Course course;

  const CustomCardCourse({
    Key? key,
    required this.width,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int courseLength = course.courseLength;
    return GestureDetector(
      onTap: (){
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (context) {
              return CourseDetailScreen(courseId: course.id,);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: Image.network(course.linkImageCover).image,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    course.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    course.description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '${ParserService.parseLevel(course.level)} • $courseLength ${AppLocalizations.of(context).translate(LanguageKey.lesson)}',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
