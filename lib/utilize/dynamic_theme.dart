import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sab/utilize/prefs.dart';

typedef Widget ThemedWidgetBuilder(BuildContext context, ThemeData data);

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
  static const String _sharedThemePreferencesKey = "light";

  @override
  void initState() {
    super.initState();
    Prefs.init();

    loadTheme().then((themeName) {
      setState(() {
        _data = themeName == AppTheme.Dark.toString()
            ? _buildDarkTheme().data
            : _buildLightTheme().data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(context, _data);
  }

  void setThemeData(ThemeData data) {
    setState(() {
      this._data = data;
    });
  }

  Future<String> loadTheme() async {
    return (Prefs.getStringF(_sharedThemePreferencesKey) ?? "Light");
  }

  AppThemeData _buildLightTheme() {
    return AppThemeData(
        AppTheme.Light,
        ThemeData(
          brightness: Brightness.light,
          accentColor: Colors.black,
          primaryColor: Colors.red,
          primaryColorBrightness: Brightness.light,
        ));
  }

  AppThemeData _buildDarkTheme() {
    return AppThemeData(
        AppTheme.Dark,
        ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.orange,
          primaryColor: Colors.brown,
          primaryColorBrightness: Brightness.dark,
        ));
  }

  void changeThemeData({AppTheme theme}) async {
    AppThemeData themeData;

    if (theme != null) {
      switch (theme) {
        case AppTheme.Dark:
          themeData = _buildDarkTheme();
          break;
        case AppTheme.Light:
          themeData = _buildLightTheme();
          break;
      }
    } else {
      loadTheme().then((themeName) {
        themeData = themeName == AppTheme.Dark.toString()
            ? _buildLightTheme()
            : _buildDarkTheme();
        _setTheme(themeData);
      });
    }

    await _setTheme(themeData);
  }

  Future _setTheme(AppThemeData themeData) async {
    setState(() {
      this._data = themeData.data;
    });

    Prefs.setString(_sharedThemePreferencesKey, themeData.name.toString());
  }
}

class AppThemeData {
  final AppTheme name;
  final ThemeData data;

  const AppThemeData(this.name, this.data);
}

enum AppTheme { Dark, Light }
