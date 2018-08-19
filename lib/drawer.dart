import 'package:flutter/material.dart';
import 'package:sab/home.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/utilize/app_options.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          padding: new EdgeInsets.all(0.0),
          child: new Center(
            child: Image.asset("resources/logo.jpg"),
          ),
        ),
        new ListTile(
          leading: new Icon(Icons.chat),
          title: new Text(TranslationBase.of(context).home),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new FirstPage()));
          },
        ),
        ListTile(
          leading: new Icon(Icons.info),
          title: new Text(TranslationBase.of(context).about),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage()));
          },
        ),
        new Divider(),
        ListTile(
          leading: new Icon(Icons.language),
          title: new Text(TranslationBase.of(context).language),
          onTap: () {
            Navigator.pop(context);
            DynamicTheme.of(context).changeLocale();
          },
        ),
        new Divider(),
        ListTile(
          leading: new Icon(Icons.brightness_low),
          title: new Text(TranslationBase.of(context).light),
          onTap: () {
            Navigator.pop(context);
            DynamicTheme.of(context).changeThemeData(theme: AppTheme.Light);
          },
        ),
        ListTile(
          leading: new Icon(Icons.brightness_high),
          title: new Text(TranslationBase.of(context).dark),
          onTap: () {
            Navigator.pop(context);
            DynamicTheme.of(context).changeThemeData(theme: AppTheme.Dark);
          },
        ),
      ],
    ));
  }
}
