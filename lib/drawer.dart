import 'package:flutter/material.dart';
import 'package:sab/home.dart';
import 'package:sab/scope_model_wrapper.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:scoped_model/scoped_model.dart';

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
        ScopedModelDescendant<AppModel>(
            builder: (context, child, model) => ListTile(
                  leading: new Icon(Icons.language),
                  title: new Text(TranslationBase.of(context).language),
                  onTap: () {
                    Navigator.pop(context);
                    model.changeDirection();
                  },
                )),
      ],
    ));
  }
}
