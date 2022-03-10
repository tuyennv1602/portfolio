import 'package:flutter/material.dart';
import 'package:my_portfolio/localizations/app_localizations.dart';

extension TranslateExtension on String {
  String translate(BuildContext context) => AppLocalizations.of(context)?.translate(this) ?? this;

  String find(BuildContext context, String key, [String? param]) {
    final finalKey = "$this.$key";
    final string = AppLocalizations.of(context)?.translate(finalKey) ?? finalKey;
    return param != null ? string.replaceFirst("%s", param) : string;
  }
}
