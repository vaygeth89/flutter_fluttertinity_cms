import 'package:flutter/material.dart';
import 'package:fluttertinity/widget/home_screen.dart';

import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterManager.generateRoute,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
