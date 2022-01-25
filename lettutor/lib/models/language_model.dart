class LanguageModel {
  /// the country code (IT,AF..)
  String? code;

  /// the locale (en, es, da)
  String? locale;

  /// the full name of language (English, Vietnamese..)
  String? language;

  /// map of keys used based on industry type (service worker, route etc)
  Map<String, String>? dictionary;

  LanguageModel({this.code, this.locale, this.language, this.dictionary});
}