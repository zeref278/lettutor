import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    Provider.of<CourseProvider>(context, listen: false)
        .fetchListCourse("1", "2")
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
    return Scaffold(
        backgroundColor: defaultBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
                width: size.width,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: CupertinoSearchTextField(
                        placeholder: 'Search course',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
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
          Consumer<CourseProvider>(
            builder: (context, courseData, _) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: courseData.courses.length,
                      itemBuilder: (context, int index) {
                        return CustomCardCourse(
                          width: size.width * 0.6,
                          course: courseData.courses[index],
                        );
                      }));
            },
          ),
              SizedBox(
                height: 15,
              ),

            ],
          ),
        ));
  }
}
