import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';

class UserApi {
  UserApi._privateConstructor();

  static final UserApi _instance = UserApi._privateConstructor();

  static UserApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> getUserInfo() async {
    try {
      final res = await _dioClient.get(
        "/user/info",

      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> changePassword(password, newPassword) async {
    try {
      final res = await _dioClient.post(
        "/auth/change-password",
        data: {'password': password, 'newPassword': newPassword},

      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateUserInfo(name, country, date) async {
    try {
      final res = await _dioClient.put(
        "/user/info",
        data: {'name': name, 'country': country, 'birthday': date},

      );
      return res;
    } catch (e) {
      rethrow;
    }
  }


}

