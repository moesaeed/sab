import 'package:flutter/material.dart';
import 'package:sab/drawer.dart';
import 'package:sab/translations_delegate_base.dart';
import 'package:sab/widgets/home_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        title: Text(TranslationBase.of(context).home),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: HomeList(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new CustomDrawer(), // new Line
      appBar: new AppBar(
        title: new Text("First Page"),
      ),
      body: new Text("I belongs to First Page"),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
      drawer: new CustomDrawer(), // New Line
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Text("I belongs to Second Page"),
    );
  }
}
