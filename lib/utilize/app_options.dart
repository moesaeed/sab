// List<String> _defaultPreferences should be [0] should be language & [1] should be theme
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sab/sab_theme.dart';
import 'package:sab/utilize/prefs.dart';

typedef Widget ThemedWidgetBuilder(
    BuildContext context, ThemeData data, Locale locale);

class DynamicTheme extends StatefulWidget {
  final ThemedWidgetBuilder themedWidgetBuilder;

  const DynamicTheme({Key key, this.themedWidgetBuilder}) : super(key: key);

  @override
  DynamicThemeState createState() => new DynamicThemeState();

  static DynamicThemeState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<DynamicThemeState>());
  }
}

class DynamicThemeState extends State<DynamicTheme> {
  ThemeData _data;
  Locale _locale;

  static const String _sharedUserPreferencesKey = "SUPK";
  List<String> _defaultPreferences = [
    AppLocale.ar.toString(),
    AppTheme.Light.toString()
  ];

  @override
  void dispose() {
    super.dispose();
    Prefs.dispose();
  }

  @override
  void initState() {
    super.initState();
    Prefs.init();

    _loadUserPreferences().then((preferences) {
      preferences = preferences[0].isEmpty ? _defaultPreferences : preferences;
      setState(() {
        _data = preferences[1] == AppTheme.Dark.toString()
            ? BuildDarkTheme().data
            : BuildLightTheme().data;

        _locale = preferences[0] == AppLocale.ar.toString()
            ? Locale("ar")
            : Locale("en");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data, _locale);
  }

  Future<List<String>> _loadUserPreferences() {
    return Prefs.getStringListF(_sharedUserPreferencesKey);
  }

  void changeThemeData({AppTheme theme}) async {
    if (theme != null) {
      _defaultPreferences[1] = theme.toString();
      await _updateUserPreferences(appTheme: theme);
    } else {
      _loadUserPreferences().then((preferences) {
        preferences =
            preferences[0].isEmpty ? _defaultPreferences : preferences;

        theme = preferences[1] == AppTheme.Dark.toString()
            ? AppTheme.Dark
            : AppTheme.Light;

        _updateUserPreferences(appTheme: theme);
      });
    }
  }

  void changeLocale({AppLocale locale}) async {
    if (locale != null) {
      await _updateUserPreferences(locale: locale);
    } else {
      _loadUserPreferences().then((preferences) {
        preferences =
            preferences[0].isEmpty ? _defaultPreferences : preferences;
        locale = preferences[0] == AppLocale.ar.toString()
            ? AppLocale.en
            : AppLocale.ar;
        _updateUserPreferences(locale: locale);
      });
    }
  }

  Future _updateUserPreferences({AppTheme appTheme, AppLocale locale}) async {
    if (appTheme != null) {
      _defaultPreferences[1] = appTheme.toString();
      setState(() {
        this._data = appTheme == AppTheme.Dark
            ? BuildDarkTheme().data
            : BuildLightTheme().data;
      });
    }
    if (locale != null) {
      _defaultPreferences[0] = locale.toString();
      setState(() {
        this._locale = locale == AppLocale.ar ? Locale("ar") : Locale("en");
      });
    }

    Prefs.setStringList(_sharedUserPreferencesKey, _defaultPreferences);
  }

  static TextStyle kufiBlack14(Color color) => new SABStyle.kufi(19.0, color);
  TextStyle get newsUrgentStyle {
    return _defaultPreferences[1] == AppTheme.Dark.toString()
        ? kufiBlack14(Colors.white)
        : kufiBlack14(Colors.black);
  }

  Color urgentBG = Color.fromRGBO(255, 41, 41, 1.0);
  final TextStyle newsDescStyle =
      kufiBlack14(Color.fromRGBO(102, 102, 102, 1.0));
}

class AppThemeData {
  final AppTheme name;
  final ThemeData data;

  const AppThemeData(this.name, this.data);
}

enum AppTheme { Dark, Light }
enum AppLocale { ar, en }
