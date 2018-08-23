import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sab/home.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(themedWidgetBuilder: (context, theme, locale) {
      return MaterialApp(
        locale: locale,
        localizationsDelegates: [
          const TranslationBaseDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', ''), // Arabic
          const Locale('en', ''), // English
        ],
        debugShowCheckedModeBanner: false,
        title: "SAB",
        theme: theme,
        home: Home(),
      );
    });
  }
}
