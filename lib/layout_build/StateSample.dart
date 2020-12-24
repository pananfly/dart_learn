
import 'package:flutter/material.dart';

class StateSample extends StatefulWidget {

  final String title;

  StateSample({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateSampleImpl();
  }
}

class StateSampleImpl extends State<StateSample> {
  bool _active = false;
  void _handleStateChange(bool change) {
    setState(() {
      _active = change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: StateBox1(
        isActive: _active,
        onActiveChange: _handleStateChange,
      ),
    );
  }
}

class StateBox1 extends StatefulWidget {

  final bool isActive;
  final ValueChanged<bool> onActiveChange;

  StateBox1({Key key, this.isActive = false, @required this.onActiveChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StateBox1Impl();
  }
}

class StateBox1Impl extends State<StateBox1> {

  bool _highLight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onActiveChange(!widget.isActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            widget.isActive ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.isActive ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highLight ? Border.all(color: Colors.teal[700], width: 10.0) : null,
        ),
      ),
    );
  }
}