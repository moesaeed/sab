import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sab/home.dart';
import 'package:sab/sab_theme.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';

class MyAppp extends StatelessWidget {
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
        //theme: SABTheme,
        //theme: model.theTheme.data,
        title: "SAB",
        theme: theme,
        home: SABBaseTheme(child: Home()),
      );
    });
  }
}
