import 'package:flutter/material.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/services/user_service.dart';

class UserProvider with ChangeNotifier {
  User get user => _user;

  User _user = User(
      id: "", email: "", name: "", linkAvatar: "", phone: "", birthday: "");

  final UserService _userService = UserService.instance;

  Future<bool> fetchUserInfo() async {
    try {
      _user = (await _userService.getUserInfo())!;
      notifyListeners();
      return true;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> changePassword(String password, String newPassword) async {
    try {
      bool result = await _userService.changePassword(password, newPassword);
      //notifyListeners();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> changeInformation({
    required String name,
    required String country,
    required String dateOfBirth,
  }) async {
    try {
      await fetchUserInfo();
      bool result = await _userService.updateUserInfo(
          name != "" ? name : _user.name,
          country != "" ? country : _user.country!,
          dateOfBirth !="" ? dateOfBirth : _user.birthday);
      if(result) fetchUserInfo();
      notifyListeners();
      return result;
    } catch (e) {
      rethrow;
    }

  }
}
