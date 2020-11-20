
import 'package:flutter/material.dart';
import 'package:dart_learn/layout_build/row-column-sample.dart';

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
  "Row column sample 2",
  "Row column sample 3",
  "Row column sample 4",
];

Map<String, WidgetBuilder> getRouteMap() {
  var map = Map<String, WidgetBuilder>();
  map.putIfAbsent(pages[0], () => (BuildContext ctx) => RowColumnSample(title: pages[0]));
  map.putIfAbsent(pages[1], () => (BuildContext ctx) => RowColumnSample(title: pages[1]));
  map.putIfAbsent(pages[2], () => (BuildContext ctx) => RowColumnSample(title: pages[2]));
  map.putIfAbsent(pages[3], () => (BuildContext ctx) => RowColumnSample(title: pages[3]));

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