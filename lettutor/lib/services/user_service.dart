import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';

class UserService {

  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  static UserService get instance => _instance;

  Future<bool> getUserInfo() async {
    try{

      var userApi = UserApi.instance;
      var res = await userApi.getUserInfo();
      var jsonRes = jsonDecode(res.toString());
    }
    catch(e) {
      // _showMyDialog(
      //     'Error', "Email or password incorrect", BasicDialogStatus.error);

    }

    return false;
  }

  Future<bool> changePassword(String password, String newPassword) async {
    try{

      var userApi = UserApi.instance;
      if (password != '' && newPassword != '') {
        var res =
        await userApi.changePassword(password, newPassword);
        if (res.statusCode != null && res.statusCode == 200) {
          var jsonRes = jsonDecode(res.toString());
          print("ChangeSuccess");



          return true;
        }
      } else {
        // _showMyDialog(
        //     'Error', "Please fill all fields", BasicDialogStatus.error);
        return false;
      }
    }
    catch(e) {
      // _showMyDialog(
      //     'Error', "Email or password incorrect", BasicDialogStatus.error);
      print("Change failt");

    }

    return false;
  }
}
