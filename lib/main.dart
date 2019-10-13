import 'package:flutter/material.dart';

import 'package:fluttertinity/widget/users_page.dart';

import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttertinity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouterManager.generateRoute,
      home: UsersPage(title: ''),
    );
  }
}
