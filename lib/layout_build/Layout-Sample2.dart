
import 'package:flutter/material.dart';

class LayoutSample2 extends StatefulWidget {

  final String title;

  LayoutSample2({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LayoutSample2State();
  }
}

class LayoutSample2State extends State<LayoutSample2> {

  bool _favorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    Widget _buildImage() {
      return Image.asset("assets/images/cake.jpg", fit: BoxFit.cover,);
    }

    void _updateFavorited(bool isFavorited) {
      setState(() {
        _favorited = isFavorited;
        if(isFavorited) {
          _favoriteCount ++;
          return;
        }
        _favoriteCount --;
      });
    }

    Widget _buildFavorite() {
      return GestureDetector(
        onTap: () => _updateFavorited(!_favorited),
        child: Row(
          children: [
            Icon(Icons.star, color: _favorited ? Colors.red : Colors.grey,),
            Text("$_favoriteCount")
          ],
        ),
      );
    }

    Widget _buildStar() {
      return Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
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
            _buildFavorite()
          ],
        ),
      );
    }

    Widget _buildActionColumn(Color color, IconData icon, String label) =>
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color,),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                    color: color
                ),
              ),
            )
          ],
        );

    Widget _buildAction() =>
        Container(
          padding: EdgeInsets.fromLTRB(32, 2, 32, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionColumn(Colors.blue, Icons.call, "CALL"),
              _buildActionColumn(Colors.blue, Icons.near_me, "ROUTE"),
              _buildActionColumn(Colors.blue, Icons.share, "SHARE"),
            ],
          ),
        );

    Widget _descriptSection() =>
        Container(
          padding: const EdgeInsets.all(32),
          child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: [
            _buildImage(),
            _buildStar(),
            _buildAction(),
            _descriptSection(),
          ],
        ),
      ),
    );
  }
}