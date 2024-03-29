
import 'dart:convert';

import 'package:lettutor/models/course.dart';
import 'package:lettutor/models/schedule.dart';
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

  static List<String> parseSearchResult(String responseBody) {
    final parsed = jsonDecode(responseBody)['rows'];

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

  static List<Schedule> parseListSchedule(String responseBody) {
    final parsed = jsonDecode(responseBody)['data']['rows'];

    return parsed.map<Schedule>((json) => Schedule.fromJson(json)).toList();
  }

  static Map<String, dynamic> listStringToJson( String key ,String src) {
    List<String> list = [];
    list.add(src);
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[key] = list;
   return data ;
  }



  static String parseLevel(String level) {

    switch(level) {
      case '0': return 'Any Level';
      case '1': return 'Beginner';
      case '2': return 'Upper-Beginner';
      case '3': return 'Pre-Intermediate';
      case '4': return 'Intermediate';
      case '5': return 'Upper-Intermediate';
      case '6': return 'Pre-Advanced';
      case '7': return 'Advanced';
    }
    return 'None';
  }

}