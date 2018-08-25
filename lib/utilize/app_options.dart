// List<String> _defaultPreferences should be [0] should be language & [1] should be theme
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sab/sab_theme.dart';
import 'package:sab/utilize/prefs.dart';

typedef Widget ThemedWidgetBuilder(
    BuildContext context, ThemeData data, Locale locale);

class AppOptions extends StatefulWidget {
  final ThemedWidgetBuilder themedWidgetBuilder;

  const AppOptions({Key key, this.themedWidgetBuilder}) : super(key: key);

  @override
  AppOptionsState createState() => new AppOptionsState();

  static AppOptionsState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<AppOptionsState>());
  }
}

class AppOptionsState extends State<AppOptions> {
  ThemeData _data;
  Locale _locale;

  AppLocale get currentLocale {
    return _locale == Locale("en") ? AppLocale.en : AppLocale.ar;
  }

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
      bool isArabic = preferences[0] == AppLocale.ar.toString();
      setState(() {
        if (preferences[1] == AppTheme.Dark.toString()) {
          _data = preferences[0] == AppLocale.ar.toString()
              ? BuildDarkTheme(true).data
              : BuildDarkTheme(false).data;
          _defaultPreferences[1] = AppTheme.Dark.toString();
        } else {
          _data = preferences[0] == AppLocale.ar.toString()
              ? BuildLightTheme(true).data
              : BuildLightTheme(false).data;
          _defaultPreferences[1] = AppTheme.Light.toString();
        }

        if (isArabic) {
          _locale = Locale("ar");
          _defaultPreferences[0] = AppLocale.ar.toString();
        } else {
          _locale = Locale("en");
          _defaultPreferences[0] = AppLocale.en.toString();
        }

        _setTextStyle(isArabic);
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
    if (locale != null) {
      _defaultPreferences[0] = locale.toString();
    }

    if (appTheme != null) {
      _defaultPreferences[1] = appTheme.toString();
    }
    bool isArabic = _defaultPreferences[0] == AppLocale.ar.toString();
    setState(() {
      if (locale != null) {
        this._locale = locale == AppLocale.ar ? Locale("ar") : Locale("en");
      }
      if (isArabic) {
        this._data = _defaultPreferences[1] == AppTheme.Dark.toString()
            ? BuildDarkTheme(true).data
            : BuildLightTheme(true).data;
      } else {
        this._data = _defaultPreferences[1] == AppTheme.Dark.toString()
            ? BuildDarkTheme(false).data
            : BuildLightTheme(false).data;
      }
    });

    Prefs.setStringList(_sharedUserPreferencesKey, _defaultPreferences);
    _setTextStyle(isArabic);
  }

  final Color urgentBG = Color.fromRGBO(255, 41, 41, 1.0);

  TextStyle newsDescStyle;
  TextStyle newsDateStyle;
  TextStyle newsSourceStyle;
  TextStyle newsUrgentStyle;
  TextStyle newsCategoryTitleStyle;
  TextStyle newsTitleStyle;

  void _setTextStyle(bool isArabic) {
    String fontFamily = isArabic ? "kufi" : "Roboto";
    newsDateStyle = SABTextStyle(
        color: Color.fromRGBO(147, 148, 149, 1.0), fontFamily: fontFamily);

    newsSourceStyle = SABTextStyle(
        color: Color.fromRGBO(240, 59, 59, 1.0), fontFamily: fontFamily);

    newsUrgentStyle = SABTextStyle(
        fontSize: 15.0,
        color: _defaultPreferences[1] == AppTheme.Dark.toString()
            ? Colors.white
            : Colors.white,
        fontFamily: fontFamily);

    newsDescStyle = SABTextStyle(
      fontSize: 16.0,
      color: _defaultPreferences[1] == AppTheme.Dark.toString()
          ? Color.fromRGBO(242, 242, 242, 1.0)
          : Color.fromRGBO(95, 95, 95, 1.0),
      fontFamily: fontFamily,
      height: isArabic ? 1.0 : 1.3,
    );

    newsCategoryTitleStyle = SABTextStyle(
      fontSize: 24.0,
      color: _defaultPreferences[1] == AppTheme.Dark.toString()
          ? Colors.white
          : Colors.black,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );

    newsTitleStyle = SABTextStyle(
      fontSize: isArabic ? 18.0 : 20.0,
      fontFamily: fontFamily,
      color: _defaultPreferences[1] == AppTheme.Dark.toString()
          ? Colors.white
          : Colors.black,
      height: isArabic ? 1.0 : 1.1,
    );
  }
}

class AppThemeData {
  final AppTheme name;
  final ThemeData data;

  const AppThemeData(this.name, this.data);
}

enum AppTheme { Dark, Light }
enum AppLocale { ar, en }
