import 'package:flutter/material.dart';
import 'package:sab/scope_model_wrapper.dart';

void main() => runApp(new ScopeModelWrapper());
//
//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:sab/utilize/prefs.dart';
//
//void main() {
//  runApp(new MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'SharedPreferences Demo',
//      home: new SharedPreferencesDemo(),
//    );
//  }
//}
//
//class SharedPreferencesDemo extends StatefulWidget {
//  SharedPreferencesDemo({Key key}) : super(key: key);
//
//  @override
//  SharedPreferencesDemoState createState() => new SharedPreferencesDemoState();
//}
//
//class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//  static final counterPref = "counter";
//  Future<int> _counter;
//
//  void _incrementCounter() {
//    final int counter = (Prefs.getInt(counterPref)) + 1;
//
//    setState(() {
//      _counter = Prefs.setInt("counter", counter).then((bool success) {
//        return counter;
//      });
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    Prefs.init();
//    _counter = Prefs.getIntF(counterPref);
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    Prefs.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: const Text("SharedPreferences Demo"),
//      ),
//      body: new Center(
//          child: new FutureBuilder<int>(
//              future: _counter,
//              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                switch (snapshot.connectionState) {
//                  case ConnectionState.waiting:
//                    return const CircularProgressIndicator();
//                  default:
//                    if (snapshot.hasError)
//                      return new Text('Error: ${snapshot.error}');
//                    else
//                      return new Text(
//                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
//                            'This should persist across restarts.',
//                      );
//                }
//              })),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ),
//    );
//  }
//}
