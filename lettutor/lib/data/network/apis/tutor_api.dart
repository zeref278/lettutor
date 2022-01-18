import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';

class TutorApi {
  TutorApi._privateConstructor();

  static final TutorApi _instance = TutorApi._privateConstructor();

  static TutorApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> getTutorById(tutorId) async {
    try {
      final res = await _dioClient.get(
        "/tutor/$tutorId",
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addTutorToFavorite(tutorId) async {
    try {
      final res = await _dioClient.post(
        "/user/manageFavoriteTutor",
        data: {'tutorId': tutorId}
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }




}

