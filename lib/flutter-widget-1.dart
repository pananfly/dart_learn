import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String EMAIL_KEY = "flutter_email";

void main() {
  runApp(MyApp());
}

showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

Future<void> saveEmail() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString(EMAIL_KEY, "admin@pananfly.com");
}

Future<String> getEmail() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString(EMAIL_KEY);
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    saveEmail();
    return MaterialApp(
      title: 'Flutter Widget 1',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.blue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Sample1(title: 'Flutter Widget 1 Test'),
      routes: <String, WidgetBuilder> {
        '1': (BuildContext ctx) => Sample2(title: "Fade Test"),
        '2': (BuildContext ctx) => Sample3(title: "Canvas Test"),
        '3': (BuildContext ctx) => Sample4(title: "Custom widget Test"),
        '4': (BuildContext ctx) => Sample5(title: "Http Test"),
        '5': (BuildContext ctx) => Sample6(title: "Http Isolate Test"),
        '6': (BuildContext ctx) => Sample7(title: "LifeCycle Test"),
        '7': (BuildContext ctx) => Sample8(title: "Gesture Test"),
        '8': (BuildContext ctx) => Sample9(title: "Edit Test"),
      },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _getChild(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Fade test"),
                  onPressed: () => Navigator.of(context).pushNamed("1"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Canvas test"),
                  onPressed: () => Navigator.of(context).pushNamed("2"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Custom test"),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("3")
                        .then(
                            (msg) =>
                            Fluttertoast.showToast(
                                msg: msg == null ? "Unknown" : msg.toString(),
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                fontSize: 16.0
                            ));
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/test.png"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Http test"),
                  onPressed: () => Navigator.of(context).pushNamed("4"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Http isolate test"),
                  onPressed: () => Navigator.of(context).pushNamed("5"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("LifeCycle test"),
                  onPressed: () => Navigator.of(context).pushNamed("6"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Gesture test"),
                  onPressed: () => Navigator.of(context).pushNamed("7"),
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Edit test"),
                  onPressed: () => Navigator.of(context).pushNamed("8"),
                ),
              ],
            ),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: _updateText,
        tooltip: "Update text",
        child: Icon(Icons.update),
      ),
    );
  }
}


class Sample2 extends StatefulWidget {
  final String title;

  Sample2({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> with TickerProviderStateMixin {

  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          _animationController.reset(); // 重置
          _animationController.forward(); // 开始
        },
      ),
    );
  }
}

class Sample3 extends StatefulWidget {
  final String title;

  Sample3({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample3State();
}

class _Sample3State extends State<Sample3>{

  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: GestureDetector(
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

class Sample4 extends StatefulWidget {
  final String title;

  Sample4({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample4State();
}

class _Sample4State extends State<Sample4>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
        body: Center(
          child: _Sample4Button("pananfly"),
        ),
    );
  }
}

// 自定义widget
class _Sample4Button extends StatelessWidget {
  final String content;
  _Sample4Button(this.content);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.of(context).pop("Result from custom widget.");
    }, child: Text(content), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),);
  }
}


class Sample5 extends StatefulWidget {
  final String title;

  Sample5({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample5State();
}

class _Sample5State extends State<Sample5> {

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext ctx, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("${i + 1}: Row ${widgets[i]["title"]}"),
    );
  }

  Future<void> loadData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(url);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}

class Sample6 extends StatefulWidget {
  final String title;

  Sample6({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample6State();
}

class _Sample6State extends State<Sample6> {

  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title)
        ),
        body: getBody(),
    );
  }

  bool showLoadingDialog() {
      return widgets == null || widgets.length <= 0;
  }

  Widget getBody() {
    if(showLoadingDialog()) {
      return getProgressDialog();
    }
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext ctx, int position) {
          return getRow(position);
        });
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Text("${i + 1}: Row ${widgets[i]["title"]}"),
        onTap: () => showToast("Click position: $i, data: ${widgets[i]}"),
      ),
    );
  }

  Widget getProgressDialog() {
    return Center(child: CircularProgressIndicator(),);
  }

  Future<void> loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);

    SendPort sendPort = await receivePort.first;
    List msg = await sendReceive(sendPort, "https://jsonplaceholder.typicode.com/posts");
    setState(() {
      widgets = msg;
    });
  }

  static Future<void> dataLoader(SendPort sendPort) async {
    ReceivePort port = ReceivePort();
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String url = data;
      http.Response response = await http.get(url);
      replyTo.send(jsonDecode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}

class Sample7 extends StatefulWidget {
  final String title;

  Sample7({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample7State();
}

class _Sample7State extends State<Sample7> with WidgetsBindingObserver {

  AppLifecycleState _state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _state = state;
      Fluttertoast.showToast(
          msg: "State: $state",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: Text("Cur lifecycle state: $_state"),
      ),
    );
  }
}

class Sample8 extends StatefulWidget {
  final String title;

  Sample8({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample8State();
}

class _Sample8State extends State<Sample8>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: GestureDetector(
          child: FlutterLogo(size: 500,),
          onTap: () => showToast("Action: onTap()"),
          onTapDown: (TapDownDetails details) => showToast("Action: onTapDown()"),
          onTapUp: (TapUpDetails details) => showToast("Action: onTapUp()"),
          onTapCancel: () => showToast("Action: onTapCancel()"),
          onDoubleTap: () => showToast("Action: onDoubleTap()"),
          onLongPress: () => showToast("Action: onLongPress()"),
          onVerticalDragStart: (DragStartDetails details) => showToast("Action: onVerticalDragStart()"),
          onVerticalDragUpdate: (DragUpdateDetails details) => showToast("Action: onVerticalDragUpdate()"),
          onVerticalDragEnd: (DragEndDetails details) => showToast("Action: onVerticalDragEnd()"),
          onHorizontalDragStart: (DragStartDetails details) => showToast("Action: onHorizontalDragStart()"),
          onHorizontalDragUpdate: (DragUpdateDetails details) => showToast("Action: onHorizontalDragUpdate()"),
          onHorizontalDragEnd: (DragEndDetails details) => showToast("Action: onHorizontalDragEnd()"),
        )
      ),
    );
  }
}

class Sample9 extends StatefulWidget {
  final String title;

  Sample9({Key key, this.title}) : super(key: key);

  @override
  State createState() => _Sample9State();
}

class _Sample9State extends State<Sample9>{

  String _errorTxt;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get text from SharePreference
    getEmail().then((value) => _textEditingController.text = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title)
      ),
      body: Center(
        child: TextField(
          controller: _textEditingController,
          onSubmitted: (String txt) {
            setState(() {
              if(isEmail(txt)) {
                _errorTxt = null;
              } else {
                _errorTxt = "Error, this is not an email.";
              }
            });
          },
          onChanged: (String txt) => setState(() {_errorTxt = null;}),
          decoration: InputDecoration(
            hintText: "This is a hint",
            errorText: _errorTxt,
          ),
        ),
      ),
    );
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}