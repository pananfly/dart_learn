import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RowColumnSample extends StatelessWidget {
  final String title;

  RowColumnSample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    );

    final subTitleText = Text(
      'Description',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        fontSize: 15,
      ),
    );

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: Icon(Icons.star, color: Colors.black),
          onTap: () => {Fluttertoast.showToast(msg: "点击了第一个星星")},
        ),
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
                // fontFamily: "Roboto",
                letterSpacing: 0.5,
                fontSize: 15),
          )
        ],
      ),
    );

    final descTextStyle = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        // fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 12,
        height: 2);

    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.kitchen,
                    color: Colors.green[500],
                  ),
                  Text('PREP:'),
                  Text('25 min'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.green[500],
                  ),
                  const Text('COOK:'),
                  Text('1 hr'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.restaurant,
                    color: Colors.green[500],
                  ),
                  Text('FEEDS:'),
                  Text('4-6'),
                ],
              ),
            ],
          ),
        ));

    final leftColumn = Container(
      padding: EdgeInsets.all(6),
      child: Column(
        children: [titleText, subTitleText, ratings, iconList],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
                flex: 2,
                child: Image.asset("assets/images/pic1.jpg"),
              ),
              Expanded(
                flex: 3,
                child: Image.asset("assets/images/pic2.jpg"),
              ),
              Expanded(
                flex: 2,
                child: Image.asset("assets/images/pic3.jpg"),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              Icon(
                Icons.star,
                color: Colors.green[500],
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              )
            ],
          ),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 380,
                    child: leftColumn,
                  ),
                  Image.asset(
                    "assets/images/cake.jpg",
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
