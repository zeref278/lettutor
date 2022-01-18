
import 'dart:convert';

import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/topic.dart';
import 'package:lettutor/models/tutor.dart';

class ParserService {
  static List<String> parseString(String input, String seperator) {
    List<String> result = input.split(seperator);
    return result;
  }

  static List<String> parseListTutor(String responseBody) {
    final parsed = jsonDecode(responseBody)['tutors']['rows'];

    return parsed.map<String>((json) => Tutor.fromJsonVer2(json).id).toList();
  }

  static List<Tutor> parseListFavoriteTutor(String responseBody) {
    final parsed = jsonDecode(responseBody)['favoriteTutor'];

    return parsed.map<Tutor>((json) => Tutor.fromJson(json)).toList();
  }

  static List<Course> parseListCourse(String responseBody) {
    final parsed = jsonDecode(responseBody)['data']['rows'];


    return parsed.map<Course>((json) => Course.fromJson(json)).toList();
  }

  static Course parseCourse(String responseBody) {
    final parsed = jsonDecode(responseBody)['data'];

    return Course.fromJsonVer2(parsed);
  }

  static List<Topic> parseListTopic(String responseBody) {

    final parsed = jsonDecode(responseBody);
    return parsed.map<Topic>((json) => Topic.fromJson(json)).toList();
  }

}