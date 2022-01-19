import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/providers/course_provider.dart';
import 'package:lettutor/ui/custom_widgets/custom_card/custom_card_course.dart';
import 'package:provider/provider.dart';

class CourseHorizontal extends StatefulWidget {

  final String category;

  const CourseHorizontal({Key? key, required this.category}) : super(key: key);

  @override
  State<CourseHorizontal> createState() => _CourseHorizontalState();
}

class _CourseHorizontalState extends State<CourseHorizontal> {
  List<Course> _list = [];
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<CourseProvider>(context, listen: false)
        .filterByCategory(widget.category)
        .then((listCourse) {
      setState(() {
        _isLoading = false;
        _list = listCourse;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading ?
        CircularProgressIndicator():
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 360,
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          scrollDirection: Axis.horizontal,
          children: _list.map((e) => Row(
            children: [
              CustomCardCourse(width: size.width * 0.6, course: e),
              SizedBox(width: 10,)
            ],
          )).toList()
        ));
  }
}