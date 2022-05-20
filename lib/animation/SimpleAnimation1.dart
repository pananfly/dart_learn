/*
 * @Author: pananfly
 * @Date: 2022-05-19 17:51:45
 * @LastEditTime: 2022-05-19 19:03:36
 * @LastEditors: pananfly
 * @Description: 
 * @FilePath: \dart_learn\lib\animation\SimpleAnimation1.dart
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

class SimpleAnimation extends StatefulWidget {
  final String title;
  SimpleAnimation({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SimpleAnimationState();
  }
}

class _SimpleAnimationState extends State<SimpleAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        _logger.d("_SimpleAnimationState status: $status");
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    // _controller.repeat(reverse: true);
    _controller.forward();
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
              child: ScaleTransition(
                scale: _animation,
                child: FlutterLogo(
                  size: 400,
                ),
              ))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
