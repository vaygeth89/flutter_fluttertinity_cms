import 'package:flutter/material.dart';
import 'package:fluttertinity/widget/app_drawer.dart';
import 'dart:js' as js;
import 'dart:math' as math;
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, double> dataMap;
  @override
  void initState() {
    super.initState();
    dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);
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
            child: Column(
          children: <Widget>[
            Container(
              child: Card(
                margin: EdgeInsets.all(25),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: PieChart(
                    dataMap: dataMap, //Required parameter
                    legendFontColor: Colors.blueGrey[900],
                    legendFontSize: 10.0,
                    legendFontWeight: FontWeight.w500,
                    animationDuration: Duration(milliseconds: 800),
                    chartLegendSpacing: 32.0,
                    chartRadius: MediaQuery.of(context).size.width / 6.7,
                    showChartValuesInPercentage: true,
                    showChartValues: true,
                    showChartValuesOutside: true,
                    chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                    colorList: [
                      Colors.yellowAccent,
                      Colors.orangeAccent,
                      Colors.redAccent,
                      Colors.greenAccent
                    ],
                    showLegends: true,
                    initialAngle: math.pi * 0.5,
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  js.context.callMethod("open", [
                    "https://github.com/vaygeth89/flutter_fluttertinity_cms"
                  ]);
                },
                child: Text(
                  "Home Page",
                  style: TextStyle(fontSize: 25, color: Colors.blueAccent),
                )),
          ],
        )),
      ),
    );
  }
}
