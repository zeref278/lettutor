import 'package:flutter/material.dart';
import 'package:lettutor/models/shedule.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/services/schedule_service.dart';
import 'package:lettutor/services/tutor_service.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> get schedules => _schedules;
  List<Schedule> get historySchedules => _historySchedules;

  final ScheduleService _scheduleService = ScheduleService.instance;

  final List<Schedule> _schedules = [];
  final List<Schedule> _historySchedules = [];

  Future<bool> fetchStudiedClassed(
      {required String page, required String perPage}) async {
    _historySchedules.clear();
    try {
      _historySchedules.addAll((await _scheduleService.getStudiedClasses(page, perPage))!);

      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> fetchUpComingClassed(
      {required String page, required String perPage}) async {
    _schedules.clear();
    try {
      _schedules.addAll((await _scheduleService.getUpcomingClasses(page, perPage))!);
      await fetchStudiedClassed(page: page, perPage: perPage);

      _schedules.removeWhere((element) => _historySchedules.where((h) => element.scheduleDetailId==h.scheduleDetailId).isNotEmpty
      );

      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  String getScheduleIdByTutorId(String tutorId) {
    String result = _historySchedules[_historySchedules.indexWhere((element) => element.tutorId==tutorId)].bookingId;
    return result;
  }
}
