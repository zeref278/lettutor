import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';

class CourseApi {
  CourseApi._privateConstructor();

  static final CourseApi _instance = CourseApi._privateConstructor();

  static CourseApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> getListCourse(page, size) async {
    try {
      final res = await _dioClient.get(
        "/course?page=$page&size=$size",
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCourseByCourseId(String id) async {
    try {
      final res = await _dioClient.get(
        "/course/$id",

      );
      return res;
    } catch (e) {
      rethrow;
    }
  }


}

