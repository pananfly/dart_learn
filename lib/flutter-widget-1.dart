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
  State createState() => _Sample3State();
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

class _Sample2State extends State<Sample1> with TickerProviderStateMixin {

  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample 2 fade test."),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: _curvedAnimation,
            child: FlutterLogo(size: 100.0,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Fade",
        child: Icon(Icons.brush),
        onPressed: ()  {
          _animationController.reset();
          _animationController.forward();
        },
      ),
    );
  }
}


class _Sample3State extends State<Sample1>{

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset> points;
  var painting = Paint();

  SignaturePainter(this.points) {
    painting..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.src);
    for(int i = 0; i < points.length - 1 ; i++) {
      if(points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], painting);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter oldDelegate) => oldDelegate.points != points;
}