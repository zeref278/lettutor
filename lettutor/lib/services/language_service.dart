import 'package:lettutor/data/ultis.dart';
import 'package:lettutor/models/language_model.dart';
import 'package:mobx/mobx.dart';

part 'language_service.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  static const String TAG = "LanguageStore";

  // repository instance
  final Ultis _ultis;

  // store for handling errors
  //final ErrorStore errorStore = ErrorStore();

  // supported languages
  List<LanguageModel> supportedLanguages = [
    LanguageModel(code: 'US', locale: 'en', language: 'English'),
    LanguageModel(code: 'VI', locale: 'vi', language: 'Vietnamese'),
  ];

  // constructor:---------------------------------------------------------------
  _LanguageStore(Ultis ultis) : this._ultis = ultis {
    init();
  }

  // store variables:-----------------------------------------------------------
  @observable
  String _locale = "en";

  @computed
  String get locale => _locale;

  // actions:-------------------------------------------------------------------
  @action
  void changeLanguage(String value) {
    _locale = value;
    _ultis.changeLanguage(value).then((_) {
      // write additional logic here
    });
  }

  @action
  String getCode() {
    var code;

    if (_locale == 'en') {
      code = "US";
    } else if (_locale == 'vi') {
      code = "VI";
    }

    return code;
  }

  @action
  String? getLanguage() {
    return supportedLanguages[supportedLanguages
        .indexWhere((language) => language.locale == _locale)]
        .language;
  }

  // general:-------------------------------------------------------------------
  void init() async {
    // getting current language from shared preference
    if (_ultis.currentLanguage != null) {
      _locale = _ultis.currentLanguage!;
    }
  }

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
