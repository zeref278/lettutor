import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';

class AuthApi {
  AuthApi._privateConstructor();

  static final AuthApi _instance = AuthApi._privateConstructor();

  static AuthApi get instance => _instance;

  final DioClient _dioClient = getIt.get<DioClient>();

  Future<dynamic> login(email, password) async {
    try {
      final res = await _dioClient.post(
        "/auth/login",
        data: {'email': email, 'password': password},

      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> checkValidToken(token) async {
  //   try {
  //     final res = await _dioClient.post(
  //       "/api/token/validtoken",
  //       data: token,
  //     );
  //     return res;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}

