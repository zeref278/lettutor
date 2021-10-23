import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/themes/custom_colors.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_course.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget horizontalList1 = Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 395.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: size.width * 0.04,
            ),
            CustomCardCourse(
              course: myCourse,
              width: size.width * 0.9,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            CustomCardCourse(
              course: myCourse,
              width: size.width * 0.9,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            CustomCardCourse(
              course: myCourse,
              width: size.width * 0.9,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
          ],
        ));
    Widget horizontalList2 = Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 395.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: size.width * 0.04,
            ),
            CustomCardCourse(
              course: myCourse,
              width: size.width * 0.9,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            CustomCardCourse(
              course: myCourse,
              width: size.width * 0.9,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
          ],
        ));
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
          //width: size.width * 0.9,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 10, width: size.width,
              ),
              Row(
                children: [
                  SizedBox(width: size.width * 0.05,),
                 Expanded(
                   child: SizedBox(
                      
                      child: CupertinoSearchTextField(
                        placeholder: 'Search course',
                      ),
                    ),
                 ),
                  SizedBox(width: size.width * 0.05,),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'English For Beginners',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              horizontalList1,
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Conversational English',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              horizontalList2,
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Business  English',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ));
  }
}
