import 'package:flutter/material.dart';
import 'package:fluttertinity/widget/app_drawer.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: InkWell(
                onTap: () {
                  js.context.callMethod("open", [
                    "https://github.com/vaygeth89/flutter_fluttertinity_cms"
                  ]);
                },
                child: Text(
                  "Home Page",
                  style: TextStyle(fontSize: 25,color: Colors.blueAccent),
                ))),
      ),
    );
  }
}
