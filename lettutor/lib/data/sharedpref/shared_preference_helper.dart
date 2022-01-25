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

  Future<bool> saveAuthTokenExpire(String authTokenExpire) async {
    return _sharedPreference.setString(Preferences.auth_token_expire, authTokenExpire);
  }

  Future<bool> saveRefreshAuthTokenExpire(String refreshAuthTokenExpire) async {
    return _sharedPreference.setString(
        Preferences.refresh_auth_token_expire, refreshAuthTokenExpire);
  }
  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.auth_token);
  }

  Future<bool> removeRefreshAuthToken() async {
    return _sharedPreference.remove(Preferences.refresh_auth_token);
  }

  Future<bool> removeAuthTokenExpire() async {
    return _sharedPreference.remove(Preferences.auth_token_expire);
  }

  Future<bool> removeRefreshAuthTokenExpire() async {
    return _sharedPreference.remove(Preferences.refresh_auth_token_expire);
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


  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }

  Future<void> changeTheme(String theme) {
    return _sharedPreference.setString(Preferences.theme_mode, theme);
  }

  String? get currentTheme {
    return _sharedPreference.getString(Preferences.theme_mode);
  }
}
