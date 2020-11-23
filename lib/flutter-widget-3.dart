
import 'package:flutter/material.dart';
import 'package:dart_learn/layout_build/row-column-sample.dart';
import 'package:dart_learn/layout_build/Container-sample.dart';
import 'package:dart_learn/layout_build/GridView-sample.dart';
import 'package:dart_learn/layout_build/ListView-sample.dart';
import 'package:dart_learn/layout_build/Stack-sample.dart';
import 'package:dart_learn/layout_build/Layout-Sample1.dart';

void main() {
  runApp(LayoutBuildSample());
}

class LayoutBuildSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout build sample",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LayoutBuildImpl(),
      routes: getRouteMap(),
    );
  }
}

const pages = [
  "Row column sample",
  "Container sample",
  "GridView sample",
  "ListView sample",
  "Stack sample",
  "Layout sample 1",
];

Map<String, WidgetBuilder> getRouteMap() {
  var map = Map<String, WidgetBuilder>();
  map.putIfAbsent(pages[0], () => (BuildContext ctx) => RowColumnSample(title: pages[0]));
  map.putIfAbsent(pages[1], () => (BuildContext ctx) => ContainerSample(title: pages[1]));
  map.putIfAbsent(pages[2], () => (BuildContext ctx) => GridViewSample(title: pages[2]));
  map.putIfAbsent(pages[3], () => (BuildContext ctx) => ListViewSample(title: pages[3]));
  map.putIfAbsent(pages[4], () => (BuildContext ctx) => StackSample(title: pages[4]));
  map.putIfAbsent(pages[5], () => (BuildContext ctx) => LayoutSample1(title: pages[5]));

  return map;
}

class LayoutBuildImpl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout build sample"),),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(context, position);
        },
      ),
    );
  }


  Widget getRow(BuildContext context, int position) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Text("${pages[position]}"),
        onTap: () => Navigator.of(context).pushNamed(pages[position]),
      ),
    );
  }
}