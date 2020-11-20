
import 'package:flutter/material.dart';

class RowColumnSample extends StatelessWidget {
  final String title;

  RowColumnSample({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitleText = Text(
        'Description',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontSize: 25,
        ),
    );

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          Text(
            '170 Review',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: "Roboto",
                letterSpacing: 0.5,
                fontSize: 20
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset("assets/images/pic1.jpg"),
              ),
              Expanded(
                child: Image.asset("assets/images/pic2.jpg"),
              ),
              Expanded(
                child: Image.asset("assets/images/pic3.jpg"),
              ),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset("assets/images/pic1.jpg"),
              ),
              Expanded(
                flex: 2,
                child: Image.asset("assets/images/pic2.jpg"),
              ),
              Expanded(
                child: Image.asset("assets/images/pic3.jpg"),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.red[500],),
              Icon(Icons.star, color: Colors.red[500],),
              Icon(Icons.star, color: Colors.green[500],),
              Icon(Icons.star, color: Colors.black,),
              Icon(Icons.star, color: Colors.black,)
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  titleText,
                  subTitleText,
                  ratings,
                ],
              ),
              Image.asset("assets/images/cake.jpg", width: 100,),
            ],
          ),
        ],
      ),
    );
  }
}

