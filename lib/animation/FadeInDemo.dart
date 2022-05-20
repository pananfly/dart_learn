/*
 * @Author: pananfly
 * @Date: 2022-05-20 11:17:51
 * @LastEditTime: 2022-05-20 11:42:52
 * @LastEditors: pananfly
 * @Description: 
 * @FilePath: \dart_learn\lib\animation\FadeInDemo.dart
 * pananfly
 */
import 'package:flutter/material.dart';

const owlUrl = 'https://img-blog.csdnimg.cn/20190925151302949.gif';

class FadeInDemo extends StatefulWidget {
  final String title;
  const FadeInDemo({Key? key, required this.title}) : super(key: key);

  @override
  State createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Image.network(owlUrl),
        TextButton(
          child: Text(
            opacity == 0.0 ? 'Show Details' : 'Hide Details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => setState(() {
            opacity = (opacity + 1) % 2; // opacity will be 0 or 1
          }),
        ),
        AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: opacity,
          child: Column(
            children: const [
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        )
      ]),
    );
  }
}
