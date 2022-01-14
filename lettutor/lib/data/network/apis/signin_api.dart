import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/services/locator_service.dart';

class SigninApi {
  SigninApi._privateConstructor();

  static final SigninApi _instance = SigninApi._privateConstructor();

  static SigninApi get instance => _instance;

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

