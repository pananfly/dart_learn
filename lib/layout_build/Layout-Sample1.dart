import 'package:flutter/material.dart';

class LayoutSample1 extends StatelessWidget {
  final String title;

  LayoutSample1({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildImage() {
      return Image.asset(
        "assets/images/cake.jpg",
        fit: BoxFit.cover,
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
                    child: Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text('41')
          ],
        ),
      );
    }

    Widget _buildActionColumn(Color color, IconData icon, String label) =>
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Container(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(color: color),
              ),
            )
          ],
        );

    Widget _buildAction() => Container(
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

    Widget _descriptSection() => Container(
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
        title: Text(this.title),
      ),
      body: Container(
        child: ListView(
          // 此处使用ListView的原因是，子内容没有完全显示时可以进行滚动浏览，如果使用Column时，超出屏幕的部分将会提示警告
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
