
import 'package:flutter/material.dart';

class LayoutSample1 extends StatelessWidget {

  final String title;

  LayoutSample1({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildImage() {
      return Image.asset("assets/images/cake.jpg", fit: BoxFit.fill,);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: _buildImage(),
      ),
    );
  }
}