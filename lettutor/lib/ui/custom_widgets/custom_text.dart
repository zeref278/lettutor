import 'package:flutter/material.dart';
import 'package:lettutor/ultis/locale/app_localization.dart';

class CustomText extends Text {
  final String languageKey;
  final BuildContext context;
  CustomText(
      this.languageKey,
      this.context, {
        Key? key,
        TextStyle? style,
        StrutStyle? strutStyle,
        TextAlign? textAlign,
        TextDirection? textDirection,
        Locale? locale,
        bool? softWrap,
        TextOverflow? overflow,
        double? textScaleFactor,
        int? maxLines,
        String? semanticsLabel,
        TextWidthBasis? textWidthBasis,
        TextHeightBehavior? textHeightBehavior,
      }) : super(
    _convertLanguageKeyToValue(context, languageKey),
    key: key,
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
  );
}

String _convertLanguageKeyToValue(BuildContext context, String languageKey) {
  return AppLocalizations.of(context).translate(languageKey);
}
