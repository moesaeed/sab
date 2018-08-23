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
        if (preferences[1] == AppTheme.Dark.toString()) {
          _data = BuildDarkTheme().data;
          _defaultPreferences[1] = AppTheme.Dark.toString();
        } else {
          _data = BuildLightTheme().data;
          _defaultPreferences[1] = AppTheme.Light.toString();
        }

        if (preferences[0] == AppLocale.ar.toString()) {
          _locale = Locale("ar");
          _defaultPreferences[0] = AppLocale.ar.toString();
        } else {
          _locale = Locale("en");
          _defaultPreferences[0] = AppLocale.en.toString();
        }
      });
    });

    _setTextStyle();
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
    _setTextStyle();
  }

  final Color urgentBG = Color.fromRGBO(255, 41, 41, 1.0);

  TextStyle newsDescStyle;
  TextStyle newsDateStyle;
  TextStyle newsSourceStyle;
  TextStyle newsUrgentStyle;
  TextStyle newsCategoryTitleStyle;

  void _setTextStyle() {
    newsDateStyle = SABTextStyle(color: Color.fromRGBO(147, 148, 149, 1.0));

    newsSourceStyle = SABTextStyle(color: Color.fromRGBO(240, 59, 59, 1.0));

    newsUrgentStyle = SABTextStyle(
        fontSize: 15.0,
        color: _defaultPreferences[1] == AppTheme.Dark.toString()
            ? Colors.black
            : Colors.white);

    newsDescStyle =
        SABTextStyle(fontSize: 13.0, color: Color.fromRGBO(102, 102, 102, 1.0));

    newsCategoryTitleStyle = SABTextStyle(
        fontSize: 24.0,
        color: _defaultPreferences[1] == AppTheme.Dark.toString()
            ? Colors.white
            : Colors.black);
  }
}

class AppThemeData {
  final AppTheme name;
  final ThemeData data;

  const AppThemeData(this.name, this.data);
}

enum AppTheme { Dark, Light }
enum AppLocale { ar, en }
