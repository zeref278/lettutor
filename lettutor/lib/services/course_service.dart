import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';

class CourseService {

  CourseService._privateConstructor();

  static final CourseService _instance = CourseService._privateConstructor();

  static CourseService get instance => _instance;

  Future<bool> getListCourse() async {
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

  Future<bool> getCourseByCourseId(String id) async {
    try{

      var courseApi = CourseApi.instance;
      if (id != '') {
        var res =
        await courseApi.getCourseByCourseId(id);
        if (res.statusCode != null && res.statusCode == 200) {
          var jsonRes = jsonDecode(res.toString());

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

    }

    return false;
  }
}
