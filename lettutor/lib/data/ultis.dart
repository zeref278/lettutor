



import 'package:lettutor/data/sharedpref/shared_preference_helper.dart';

class Ultis {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  //constructor for postApi, post datasource
  //Repository(this._postApi, this._sharedPrefsHelper, this._postDataSource);
  Ultis(this._sharedPrefsHelper);

  // Language: -----------------------------------------------------------------
  // Future<void> changeLanguage(String value) =>
  //     _sharedPrefsHelper.changeLanguage(value);
  //
  // String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}