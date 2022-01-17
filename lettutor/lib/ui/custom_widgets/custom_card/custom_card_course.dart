import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/ui/courses/course_detail_screen.dart';

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
    String level = course.level;
    int courseLength = course.courseLength;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CourseDetailScreen(course: course,);
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
                image: AssetImage(course.linkImageCover),
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
                    course.shortDescription,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '$level • $courseLength Lessons',
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
