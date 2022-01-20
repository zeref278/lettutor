import 'package:flutter/material.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/hard_code.dart';
import 'package:lettutor/services/course_service.dart';



class CourseProvider with ChangeNotifier {
  List<Course> get courses => _courses;
  Course get course => _course;

  Course _course = myCourse;
  final CourseService _courseService = CourseService.instance;

  final List<Course> _courses = [];

  Future<bool> fetchListCourse(String page, String size) async {
    try {
      List<Course> result = await _courseService.getListCourse(page, size);
      _courses.clear();
      _courses.addAll(result);
      notifyListeners();

      return true;
    } catch(e) {
      rethrow;
    }
  }

  Future<List<Course>> searchCourse(String keyWord) async {

    List<Course> result = [];

    try {

      for (var element in _courses) {
        if(element.name.toUpperCase().contains(keyWord.toUpperCase())) {
          result.add(element);
        }
      }

      notifyListeners();
      return result;
    } catch (e) {
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

  Future<List<Course>> filterByCategory(String category) async {
    try {
      await fetchListCourse("1", "1000");
      List<Course> result = [];
      result =  _courses.where((element) {
        for(var e in element.categories!) {
          if(e.title == category) {
            return true;
          }
        }
        return false;
      }).toList();

      result.sort((first, second) => (int.parse(first.level) > int.parse(second.level) ? 1 : 0));
      return result;
    } catch(e) {
      rethrow;
    }
  }


}
