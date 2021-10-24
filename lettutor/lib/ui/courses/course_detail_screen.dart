import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/ui/custom_widgets/custom_button/custom_text_button.dart';
import 'package:lettutor/ui/custom_widgets/custom_divider/custom_divider_text.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    String level = course.level;
    int courseLength = course.courseLength;
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(course.linkImageCover),
              ),
            ),
            SizedBox(height: 15),
            Text(
              course.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 2,
            ),
            CustomDividerText(
              child: Text('Overview',
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
                Text(
                  'Why take this course',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              course.firstOverview,
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
                Text(
                  'What will you be able to do',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              course.secondOverview,
            ),
            CustomDividerText(
              child: Text('Experience Level',
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
                  '$level',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            CustomDividerText(
              child: Text('Course Length',
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
                  '$courseLength topics',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                )
              ],
            ),
            CustomDividerText(
              child: Text('List Topics',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            Text(
              '1. Foods You Love',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '2. Your Job',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '3. Playing and Watching Sports',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '4. The Best Pet',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '5. Having Fun in Your Free Time',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '6. Your Daily Routine',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '7. Childhood Memories',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '8. our Family Members',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '9. Your Hometown',
              style: TextStyle(fontSize: 17,),
            ),
            SizedBox(height: 5),
            Text(
              '10. Shopping Habits',
              style: TextStyle(fontSize: 17,),
            ),
            const CustomDividerText(
              child: Text('Recommended Tutors',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ),
            Row(
              children: <Widget>[
                Icon(
                  CupertinoIcons.person_crop_circle_badge_checkmark,
                  color: defaultPrimaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomTextButton(
                  title: Text(
                    'Duy Truong',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,),
                  ),
                  onPressed: () {  },

                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
