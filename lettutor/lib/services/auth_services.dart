
import 'dart:convert';

import 'package:lettutor/data/network/apis/api.dart';
import 'package:lettutor/data/sharedpref/preferences.dart';
import 'package:lettutor/data/sharedpref/shared_preference_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {

  AuthServices._privateConstructor();

  static final AuthServices _instance = AuthServices._privateConstructor();

  static AuthServices get instance => _instance;

  final _authApi = AuthApi.instance;

  Future<bool> signInService(String email, String password) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      SharedPreferenceHelper sharedPreferenceHelper =
          SharedPreferenceHelper(sharedPreferences);

      if (email != '' && password != '') {
        var res = await _authApi.login(email, password);
        if (res.statusCode != null && res.statusCode == 200) {
          var jsonRes = jsonDecode(res.toString());
          final String accessToken = jsonRes['tokens']['access']['token'];
          final String accessTokenExpire =
              jsonRes['tokens']['access']['expires'];
          final String refreshToken = jsonRes['tokens']['refresh']['token'];
          final String refreshTokenExpire =
              jsonRes['tokens']['refresh']['expires'];

          //Save tokens
          await sharedPreferenceHelper.saveAuthToken(accessToken);
          await sharedPreferenceHelper.saveAuthTokenExpire(accessTokenExpire);
          await sharedPreferenceHelper.saveRefreshAuthToken(refreshToken);
          await sharedPreferenceHelper
              .saveRefreshAuthTokenExpire(refreshTokenExpire);

          return true;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }

    return false;
  }

  Future<bool> forgotPassword(String email) async {
    try {
      if (email != '') {
        var res = await _authApi.forgotPassword(email);
        if (res.statusCode != null && res.statusCode == 200) {
          return true;
        }
        return false;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }

  }

  Future<int> checkAlreadySignin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? savedToken = sharedPreferences.getString(Preferences.auth_token);
    String? savedTokenExpire =
        sharedPreferences.getString(Preferences.auth_token_expire);
    String? savedRefreshToken =
        sharedPreferences.getString(Preferences.refresh_auth_token);
    String? savedRefreshTokenExpire =
        sharedPreferences.getString(Preferences.refresh_auth_token_expire);

    if (savedToken != null) {
      try {
        if (DateTime.parse(savedTokenExpire!).isAfter(
            DateTime.now().add(const Duration(minutes: 10)).toUtc())) {
          return 1;
        }
        else if(DateTime.parse(savedRefreshTokenExpire!).isAfter(
            DateTime.now().add(const Duration(minutes: 10)).toUtc())) {
          return 0;
        }
        else {
          return -1;
        }
      } catch (e) {
        return -1;
      }
    }
    return -1;
  }

  Future<bool> signOut() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      SharedPreferenceHelper sharedPreferenceHelper =
          SharedPreferenceHelper(sharedPreferences);

      //Save tokens
      await sharedPreferenceHelper.removeAuthToken();
      await sharedPreferenceHelper.removeAuthTokenExpire();
      await sharedPreferenceHelper.removeRefreshAuthToken();
      await sharedPreferenceHelper.removeRefreshAuthTokenExpire();

      return true;
    } catch (e) {
      return false;
    }
  }
}
