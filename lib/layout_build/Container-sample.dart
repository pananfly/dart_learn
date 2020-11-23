

import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {

  final String title;

  ContainerSample({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8))
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset("assets/images/pic$imageIndex.jpg", fit: BoxFit.contain,),
      ),
    );

    Widget _buildImageRow(int imageIndex) => Row(
      children: [
        _buildDecoratedImage(imageIndex),
        _buildDecoratedImage(imageIndex + 1),
      ],
    );

    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black26),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildImageRow(1),
                  _buildImageRow(3),
                ],
              ),
            ),
          ]
        ),
    );
  }
}