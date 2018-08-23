import 'package:flutter/material.dart';
import 'package:sab/utilize/app_options.dart';

AppThemeData BuildLightTheme(bool arabic) {
  final ThemeData base = arabic
      ? ThemeData(brightness: Brightness.light, fontFamily: 'kufi')
      : ThemeData(brightness: Brightness.light, fontFamily: 'Raleway');
  return AppThemeData(
      AppTheme.Light,
      base.copyWith(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        primaryColorBrightness: Brightness.light,
        primaryTextTheme: base.textTheme,
        primaryIconTheme: base.iconTheme.copyWith(color: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        //accentTextTheme:
      ));
}

AppThemeData BuildDarkTheme(bool arabic) {
  final ThemeData base = arabic
      ? ThemeData(brightness: Brightness.dark, fontFamily: 'kufi')
      : ThemeData(brightness: Brightness.dark, fontFamily: 'Raleway');

  return AppThemeData(
      AppTheme.Dark,
      base.copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        canvasColor: Colors.black,
        dividerColor: Colors.grey,
      ));
}

class SABTextStyle extends TextStyle {
  const SABTextStyle({
    double fontSize = 12.0,
    FontWeight fontWeight,
    Color color = Colors.black,
    double letterSpacing,
    double height,
    String fontFamily,
  }) : super(
          inherit: false,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}
