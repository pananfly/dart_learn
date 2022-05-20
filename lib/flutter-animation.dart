/*
 * @Author: pananfly
 * @Date: 2022-05-19 17:05:30
 * @LastEditTime: 2022-05-20 14:51:09
 * @LastEditors: pananfly
 * @Description: 
 * @FilePath: \dart_learn\lib\flutter-animation.dart
 * pananfly
 */
import 'package:dart_learn/animation/AnimationBuilder.dart';
import 'package:dart_learn/animation/FadeInDemo.dart';
import 'package:dart_learn/animation/StaggerDemo.dart';
import 'package:flutter/material.dart';
import 'animation/SimpleAnimation1.dart';
import 'animation/AnimatedContainerDemo.dart';

void main() => runApp(const AnimationApp());

class AnimationApp extends StatelessWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation Test",
      home: AnimationWidget(),
      routes: getRouteMap(),
    );
  }
}

const pages = [
  "Simple Animation",
  "Animation Builder sample",
  "FadeIn Demo",
  "Animated Container Demo",
  "Stagger Demo"
];

Map<String, WidgetBuilder> getRouteMap() {
  var map = Map<String, WidgetBuilder>();
  map.putIfAbsent(
      pages[0], () => (BuildContext ctx) => SimpleAnimation(title: pages[0]));
  map.putIfAbsent(
      pages[1], () => (BuildContext ctx) => AnimationBuilder(title: pages[1]));
  map.putIfAbsent(
      pages[2], () => (BuildContext ctx) => FadeInDemo(title: pages[2]));
  map.putIfAbsent(pages[3],
      () => (BuildContext ctx) => AnimatedContainerDemo(title: pages[3]));
  map.putIfAbsent(pages[4], () => (BuildContext ctx) => StaggerDemo());
  return map;
}

class AnimationWidget extends StatelessWidget {
  Widget _getRow(BuildContext context, int postion) {
    return ListTile(
      key: ValueKey(pages[postion]),
      contentPadding: EdgeInsets.all(10),
      title: Text(pages[postion]),
      onTap: () => {Navigator.of(context).pushNamed(pages[postion])},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation widget"),
        ),
        body: ListView.builder(
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int postion) {
              return _getRow(context, postion);
            }));
  }
}
