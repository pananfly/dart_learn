

import 'package:flutter/material.dart';

class GridViewSample extends StatelessWidget {

  final String title;

  GridViewSample({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Container> _buildGridTileList(int count) => List.generate(
        count, (index) => Container(child: Image.asset("assets/images/pic${index + 1}.jpg"),));

    Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 240,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(4),
    ); // 直接定义每列占多大

    Widget _buildGridItem(BuildContext context, int index) =>
        Container(child: Image.asset("assets/images/pic${index + 1}.jpg"),);

    Widget _buildGrid2() => GridView.builder(
        itemCount: 4,
        itemBuilder: _buildGridItem,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), // 定义每行多少个
    );

    Widget _buildGrid3() => GridView.builder(
        itemCount: 4,
        itemBuilder: _buildGridItem,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // 每项占多大
            crossAxisSpacing: 4, // 横向左右项之间的间隔
            mainAxisSpacing: 4, // 纵向上下项之间的间隔
        ), // 定义每列占多大
    );

    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: Container(
          padding: EdgeInsets.all(10),
            child: _buildGrid3(),
        ),
    );
  }
}