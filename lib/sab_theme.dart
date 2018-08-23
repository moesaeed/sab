import 'package:flutter/material.dart';
import 'package:sab/utilize/app_options.dart';

const scaffoldBackground = Colors.white;
const urgentBG = Color.fromRGBO(255, 41, 41, 1.0);

TextStyle kufiBlack16(Color color) => new SABStyle.kufi(16.0, color);
TextStyle kufiBlack14(Color color) => new SABStyle.kufi(14.0, color);
TextStyle kufiBlack12(Color color) => new SABStyle.kufi(12.0, color);
TextStyle kufiBlack24(Color color) =>
    new SABStyle.kufi(24.0, color, weight: FontWeight.bold);

final ThemeData SABTheme = _buildSABTheme();

ThemeData _buildSABTheme() {
  final ThemeData base =
      ThemeData(brightness: Brightness.light, fontFamily: 'kufi');
  return base.copyWith(
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: scaffoldBackground,
  );
}

class SABStyle extends TextStyle {
  const SABStyle.roboto(double size, FontWeight weight, Color color)
      : super(
            inherit: false,
            color: color,
            fontSize: size,
            fontWeight: weight,
            textBaseline: TextBaseline.alphabetic);

  const SABStyle.kufi(double size, Color color, {FontWeight weight})
      : super(
            inherit: false,
            color: color,
            fontFamily: 'kufi',
            fontSize: size,
            fontWeight: weight,
            textBaseline: TextBaseline.alphabetic);
}

/// The TextStyles and Colors used for titles, labels, and descriptions. This
/// InheritedWidget is shared by all of the routes and widgets created for
/// the SAB app.
class SABBaseTheme extends InheritedWidget {
  SABBaseTheme({Key key, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  final Color appBarBackgroundColor = Colors.white;
  final TextStyle quantityMenuStyle = kufiBlack16(Colors.black54);
  final TextStyle appBarTitleStyle = kufiBlack16(Colors.black87);
  final TextStyle newsSourceStyle =
      kufiBlack12(Color.fromRGBO(240, 59, 59, 1.0));

  final TextStyle newsTitleStyle = kufiBlack16(Colors.black);
  final TextStyle newsDescStyle =
      kufiBlack14(Color.fromRGBO(102, 102, 102, 1.0));
  final TextStyle newsDateStyle =
      kufiBlack14(Color.fromRGBO(147, 148, 149, 1.0));
  final TextStyle newsUrgentStyle = kufiBlack14(Colors.black);
  final TextStyle newsCategoryTitleStyle = kufiBlack24(Colors.black);

  static SABBaseTheme of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(SABBaseTheme);

  @override
  bool updateShouldNotify(SABBaseTheme oldWidget) => false;
}

//****************************//
//****************************//
//************Building The Theme****************//
//****************************//
//****************************//
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

TextTheme _buildSABTextTheme(TextTheme base) {
  return base.copyWith().apply();
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
