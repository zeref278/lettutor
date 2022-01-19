import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/models/shedule.dart';
import 'package:lettutor/services/parser_service.dart';

class ScheduleService {
  ScheduleService._privateConstructor();

  static final ScheduleService _instance = ScheduleService._privateConstructor();

  static ScheduleService get instance => _instance;

  final _scheduleApi = ScheduleApi.instance;

  Future<List<Schedule>?> getStudiedClasses(String page, String perPage) async {


    try {
      var res = await _scheduleApi.getStudiedClasses(page, perPage);

      if (res.statusCode != null && res.statusCode == 200) {
        return ParserService.parseListSchedule(res.toString());
      }
      return null;
    } catch(e) {
      rethrow;
    }
  }

  Future<List<Schedule>?> getUpcomingClasses(String page, String perPage) async {


    try {
      var res = await _scheduleApi.getUpcomingClasses(page, perPage);

      if (res.statusCode != null && res.statusCode == 200) {
        return ParserService.parseListSchedule(res.toString());
      }
      return null;
    } catch(e) {
      rethrow;
    }
  }


}
