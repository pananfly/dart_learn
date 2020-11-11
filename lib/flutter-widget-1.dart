import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget 1',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Sample1(title: 'Flutter Widget 1 Test'),
    );
  }
}

class Sample1 extends StatefulWidget {
  final String title;

  Sample1({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample1State();
}

String sample1Txt = "pananfly";
class _Sample1State extends State<Sample1> {
  var _random = Random();
  bool check = false;
  void _updateText() {
    setState(() {
      sample1Txt = "pananfly" + _random.nextInt(1000).toString();
      check = !check;
    });
  }

  Widget _getChild() {
    if(check) {
      return Checkbox(value: true, onChanged: (cb) => {

      },);
    } else {
      return Text(sample1Txt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: _getChild(),
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: _updateText,
        tooltip: "Update text",
        child: Icon(Icons.update),
      ),
    );
  }
}