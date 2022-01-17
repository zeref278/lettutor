
import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/data/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {

  AuthServices._privateConstructor();

  static final AuthServices _instance = AuthServices._privateConstructor();

  static AuthServices get instance => _instance;

  final _authApi = AuthApi.instance;

  Future<bool> SignInService(String email, String password) async {
    try{
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      SharedPreferenceHelper sharedPreferenceHelper =
      SharedPreferenceHelper(sharedPreferences);

      if (email != '' && password != '') {
        var res =
            await _authApi.login(email, password);
        if (res.statusCode != null && res.statusCode == 200) {
          var jsonRes = jsonDecode(res.toString());
          final String accessToken = jsonRes['tokens']['access']['token'];
          final String refreshToken =
          jsonRes['tokens']['refresh']['token'];

          //Save tokens
          await sharedPreferenceHelper.saveAuthToken(accessToken);
          await sharedPreferenceHelper.saveRefreshAuthToken(refreshToken);

          return true;
        }
      } else {

        return false;
      }
    }
    catch(e) {


    }

    return false;
  }
  // Future<bool> CheckAlreadySignin() async {
  //
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? savedToken = sharedPreferences.getString(Preferences.auth_token);
  //   String? savedRefreshToken = sharedPreferences.getString(Preferences.refresh_auth_token);
  //   if(savedToken != null){
  //     LoginApi loginApi = LoginApi.instance;
  //     try{
  //       var res = await loginApi.checkValidToken(savedToken);
  //       if (res.statusCode != null && res.statusCode == 200) {
  //         _showMyDialog(
  //             'Success', "Log in Success", BasicDialogStatus.success);
  //       } else {
  //         try{
  //           var res = await loginApi.checkValidToken(savedRefreshToken);
  //           if (res.statusCode != null && res.statusCode == 200) {
  //             _showMyDialog(
  //                 'Success', "Log in Success", BasicDialogStatus.success);
  //           }
  //         }catch(e){
  //           rethrow;
  //         }
  //
  //       }
  //     }catch(e){
  //       rethrow;
  //     }
  //
  //   }
  //   return false;
  // }
}
