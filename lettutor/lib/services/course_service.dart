import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/services/parser_service.dart';

class CourseService {

  CourseService._privateConstructor();

  static final CourseService _instance = CourseService._privateConstructor();

  static CourseService get instance => _instance;

  final _courseApi = CourseApi.instance;

  Future<List<Course>> getListCourse(String page, String size) async {
    try{
      var res = await _courseApi.getListCourse(page, size);
      return ParserService.parseListCourse(res.toString());
    }
    catch(e) {
      rethrow;

    }
    
  }

  Future<Course?> getCourseByCourseId(String courseId) async {
    try{

        var res =
        await _courseApi.getCourseByCourseId(courseId);
        if (res.statusCode != null && res.statusCode == 200) {
          return ParserService.parseCourse(res.toString());
          
        }
        return null;

    }
    catch(e) {
      rethrow;

    }

  }
}
