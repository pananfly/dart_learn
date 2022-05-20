/*
 * @Author: pananfly
 * @Date: 2022-05-19 19:15:24
 * @LastEditTime: 2022-05-20 11:15:50
 * @LastEditors: pananfly
 * @Description: 
 * @FilePath: \dart_learn\lib\animation\AnimationBuilder.dart
 * pananfly
 */

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class _MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

var _logger = Logger(
  filter: _MyFilter(), // 默认debug才打印，release不打印，需要在VS的output中正常打印需要自定义
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
      ),
);

class AnimationBuilder extends StatefulWidget {
  final String title;
  AnimationBuilder({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AnimationBuilderState();
  }
}

class _AnimationBuilderImpl extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Animation<double> alphaAnimation;
  const _AnimationBuilderImpl(
      {Key? key,
      required this.child,
      required this.animation,
      required this.alphaAnimation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: alphaAnimation.value,
            child: SizedBox(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
          );
        },
        child: child, // 不要忘了这一行
      ),
    );
  }
}

class _AnimationBuilderState extends State<AnimationBuilder>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _alphaAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addStatusListener((status) {
        _logger.d("_AnimationBuilderState status: $status");
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
      });
    _alphaAnimation = Tween<double>(begin: 1, end: 0.2).animate(_controller)
      ..addStatusListener((status) {
        _logger.d("_AnimationBuilderState alpha status: $status");
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
      });
    _controller.repeat(reverse: true);
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
              color: Colors.black,
              child: _AnimationBuilderImpl(
                child: FlutterLogo(),
                animation: _animation,
                alphaAnimation: _alphaAnimation,
              )),
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
