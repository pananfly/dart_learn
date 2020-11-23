
import 'package:flutter/material.dart';

class StackSample extends StatelessWidget {

  final String title;

  StackSample({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildStack() => Stack(
      alignment: const Alignment(-1.0, 0.0), // 0,0 是居中 其他值是偏移倍数, 倍数1是到第一个子view的边
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/pic1.jpg'),
          radius: 100,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/pic2.jpg'),
          radius: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Stack sample',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: Container(
          padding: EdgeInsets.all(10),
            child: _buildStack(),
        ),
    );
  }
}