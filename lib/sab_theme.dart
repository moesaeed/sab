import 'package:flutter/material.dart';
import 'package:sab/utilize/app_options.dart';

AppThemeData BuildLightTheme() {
  final ThemeData base =
      ThemeData(brightness: Brightness.light, fontFamily: 'kufi');
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

AppThemeData BuildDarkTheme() {
  final ThemeData base =
      ThemeData(brightness: Brightness.dark, fontFamily: 'kufi');
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
  }) : super(
          inherit: false,
          color: color,
          fontSize: fontSize,
          fontFamily: 'kufi',
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}
