
import 'package:flutter/material.dart';

class LayoutSample1 extends StatelessWidget {

  final String title;

  LayoutSample1({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildImage() {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Image.asset("assets/images/cake.jpg", fit: BoxFit.fill,),
      );
    }

    Widget _buildStar() {
      return Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("Oeschinen Lake Campground",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text("Kandersteg, Switzerland",
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red,),
          Text('41')
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        child: ListView(
          children: [
            _buildImage(),
            _buildStar(),
          ],
        ),
      ),
    );
  }
}