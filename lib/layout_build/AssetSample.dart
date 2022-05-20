import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetSample extends StatefulWidget {
  final String title;

  AssetSample({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AssetState();
  }
}

class AssetState extends State<AssetSample> {
  String _content = "";

  Future<String> _loadJson() async {
    return await rootBundle.loadString("assets/json/1.json");
  }

  void _updateContent(String txt) {
    setState(() {
      _content = txt;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJson().then((value) => _updateContent(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              _content,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
