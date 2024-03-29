import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lettutor/services/parser_service.dart';

class ScheduleApi {
  ScheduleApi._privateConstructor();

  static final ScheduleApi _instance = ScheduleApi._privateConstructor();

  static ScheduleApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> getStudiedClasses(page, perPage) async {
    try {
      int myTimeStamp = Timestamp.fromDate(
              DateTime.now().toUtc().subtract(Duration(minutes: 35)))
          .millisecondsSinceEpoch;
      print(myTimeStamp);
      final res = await _dioClient.get(
        "/booking/list/student?page=$page&perPage=$perPage&dateTimeLte=$myTimeStamp&orderBy=meeting&sortBy=desc",
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getUpcomingClasses(page, perPage) async {
    try {
      int myTimeStamp = Timestamp.fromDate(
              DateTime.now().toUtc().add(const Duration(days: 100)))
          .millisecondsSinceEpoch;
      final res = await _dioClient.get(
        "/booking/list/student?page=$page&perPage=$perPage&dateTimeLte=$myTimeStamp&orderBy=meeting&sortBy=asc",
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> cancelBookedClasses(scheduleDetailId) async {
    try {
      final res = await _dioClient
          .delete("/booking", data: {"scheduleDetailIds" : [scheduleDetailId]});
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
