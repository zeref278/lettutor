import 'package:lettutor/data/sharedpref/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString("auth_token");
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.auth_token, authToken);
  }

  Future<bool> saveRefreshAuthToken(String refreshAuthToken) async {
    return _sharedPreference.setString(Preferences.refresh_auth_token, refreshAuthToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.auth_token);
  }

  Future<String?> get authenticationKey async {
    return _sharedPreference.getString(Preferences.authen_key);
  }

  Future<bool> saveAuthenticationKey(String keyStr) async {
    return _sharedPreference.setString(Preferences.authen_key, keyStr);
  }

  Future<bool> removeAuthKey() async {
    return _sharedPreference.remove(Preferences.authen_key);
  }
  //-MARK:Added by Hieu Minh Dec 25 2021
  // Language:---------------------------------------------------
  // String? get currentLanguage {
  //   return _sharedPreference.getString(Preferences.current_language);
  // }
  //
  // Future<void> changeLanguage(String language) {
  //   return _sharedPreference.setString(Preferences.current_language, language);
  // }
}
