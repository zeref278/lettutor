import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/models/user.dart';

class UserService {
  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  static UserService get instance => _instance;

  final _userApi = UserApi.instance;

  Future<User?> getUserInfo() async {

    try {
      var res = await _userApi.getUserInfo();

      if (res.statusCode != null && res.statusCode == 200) {
        var jsonRes = jsonDecode(res.toString());
        return User.fromJson(jsonRes['user']);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changePassword(String password, String newPassword) async {
    try {

      if (password != '' && newPassword != '') {
        var res = await _userApi.changePassword(password, newPassword);
        if (res.statusCode != null && res.statusCode == 200) {

          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }

    return false;
  }

}
