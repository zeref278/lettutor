import 'package:flutter/material.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/services/schedule_service.dart';

class ScheduleProvider with ChangeNotifier {
  List<Schedule> get schedules => _schedules;
  List<Schedule> get historySchedules => _historySchedules;

  final ScheduleService _scheduleService = ScheduleService.instance;

  final List<Schedule> _schedules = [];
  final List<Schedule> _historySchedules = [];

  Future<bool> fetchStudiedClassed(
      {required String page, required String perPage}) async {

    try {
      List<Schedule> result = [];
      result.addAll((await _scheduleService.getStudiedClasses(page, perPage))!);

      _historySchedules.clear();
      _historySchedules.addAll(result);
      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  int getTotalTimeStudied() {
    return 25 * _historySchedules.length;
  }

  Future<bool> fetchUpComingClassed(
      {required String page, required String perPage}) async {
    try {
      List<Schedule> result = [];
      result
          .addAll((await _scheduleService.getUpcomingClasses(page, perPage))!);

      await fetchStudiedClassed(page: page, perPage: perPage);
      result.removeWhere((element) => _historySchedules
          .where((h) => element.scheduleDetailId == h.scheduleDetailId)
          .isNotEmpty);
      _schedules.clear();
      _schedules.addAll(result);

      notifyListeners();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  String getScheduleIdByTutorId(String tutorId) {
    String result = _historySchedules[_historySchedules
            .indexWhere((element) => element.tutorId == tutorId)]
        .bookingId;
    return result;
  }

  Future<bool> cancelBookedClasses(String id) async {
    try {
      bool result = await _scheduleService.cancelBookedClassed(id);
      if (result) {
        await fetchUpComingClassed(page: "1", perPage: "1000");
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
