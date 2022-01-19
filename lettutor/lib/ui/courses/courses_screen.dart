import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/constants/ui_constants.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/ui/courses/courses_horizontal.dart';
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

          //CourseHorizontal(category: "English for Beginners"),
          Consumer<CourseProvider>(
            builder: (context, courseData, _) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: Course.allCategory.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                Course.allCategory[index],
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            CourseHorizontal(category: Course.allCategory[index]),
                          ],
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
