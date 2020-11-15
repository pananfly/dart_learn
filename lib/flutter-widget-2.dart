

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Widget 2',
    home: Sample2Widget(),
  ));
}

Widget getSimpleWidget() {
  return Center(
    child: Text(
      "Hello, pananfly!",
      textDirection: TextDirection.ltr,
    ),
  );
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              "Example title",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded( // Expanded 扩展其他widget未使用的空间，如有多个expend则使用flex设置占用比例
            child: Center(
              child: Text('Hello, pananfly!'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {

  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(child: title,),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),

    );
  }
}

class Sample2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
        title: Text("Widget sample 2"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Text("Hello pananfly!"),
      ),
    );
  }
}