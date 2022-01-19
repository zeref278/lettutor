import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleApi {
  ScheduleApi._privateConstructor();

  static final ScheduleApi _instance = ScheduleApi._privateConstructor();

  static ScheduleApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> getBookedClasses(page, perPage, dateTimeLte) async {
    try {
      final res = await _dioClient.get(
        "/booking/list/student?page=$page&perPage=$perPage&dateTimeLte=$dateTimeLte&orderBy=meeting&sortBy=desc",
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }



}

