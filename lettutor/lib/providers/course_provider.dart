import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/services/course_service.dart';



class CourseProvider with ChangeNotifier {
  List<Course> get courses => _courses;
  Course get course => _course;

  Course _course = myCourse;
  final CourseService _courseService = CourseService.instance;

  List<Course> _courses = [];

  Future<bool> fetchListCourse(String page, String size) async {
    _courses.clear();
    try {
      _courses = await _courseService.getListCourse(page, size);
      print(_courses.length);
      notifyListeners();

      return true;
    } catch(e) {
      rethrow;
    }
  }

  Future<bool> fetchCourse(String courseId) async {
    try {
      _course =  (await _courseService.getCourseByCourseId(courseId))!;
      notifyListeners();
      return true;
    } catch (err) {
      rethrow;
    }
  }


}
