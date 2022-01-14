
import 'dart:convert';


import 'package:lettutor/data/network/apis/signin_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<bool> SignInService(String email, String password) async {
    try{
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // SharedPreferenceHelper sharedPreferenceHelper =
      // SharedPreferenceHelper(sharedPreferences);
      var signApi = SigninApi.instance;
      if (email != '' && password != '') {
        var res =
            await signApi.login(email, password);
        if (res.statusCode != null && res.statusCode == 200) {
          // final String accessToken = jsonDecode(res.toString())['access_token'];
          // final String refreshToken =
          // jsonDecode(res.toString())['refresh_token'];

          //_showMyDialog('Success', 'Log in Success', BasicDialogStatus.success);
          return true;
          //Save tokens
          // sharedPreferenceHelper.saveAuthToken(accessToken);
          // sharedPreferenceHelper.saveRefreshAuthToken(refreshToken);
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
