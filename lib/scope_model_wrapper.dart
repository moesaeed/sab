import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sab/my_app.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyApp());
  }
}

class AppModel extends Model {
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale ?? Locale("ar");

  void changeDirection() {
    _appLocale = _appLocale == Locale("ar") ? Locale("en") : Locale("ar");
    print(_appLocale.toString());
    setLocale(_appLocale.toString());
    notifyListeners();
  }

  static const String _sharedLocalePreferencesKey = "defaultLocale";

  void setLocale(String locale) async {
    print("set $locale");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sharedLocalePreferencesKey, locale);
  }

  Future<String> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("loading.....");
    return (prefs.getString(_sharedLocalePreferencesKey));
  }
}
