

import 'package:flutter/material.dart';


class ListViewData {
  String title;
  String subTitle;
  IconData iconData;

  ListViewData(this.title, this.subTitle, this.iconData);
}

class ListViewSample extends StatelessWidget {

  final String title;

  ListViewSample({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    ListTile _buildListItem(String title, String subTitle, IconData icon) => ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20
        ),
      ),
      subtitle: Text(subTitle),
      leading: Icon(icon, color: Colors.blue[500],),
    );

    Widget _buildList() => ListView(
      children: [
        _buildListItem('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _buildListItem('The Castro Theater', '429 Castro St', Icons.theaters),
        _buildListItem('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _buildListItem('Roxie Theater', '3117 16th St', Icons.theaters),
        _buildListItem('United Artists Stonestown Twin', '501 Buckingham Way', Icons.theaters),
        _buildListItem('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        Divider(),
        _buildListItem('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _buildListItem('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _buildListItem('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _buildListItem('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );

    List<ListViewData> _listDatas = [
      ListViewData('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      ListViewData('The Castro Theater', '429 Castro St', Icons.theaters),
      ListViewData('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      ListViewData('Roxie Theater', '3117 16th St', Icons.theaters),
      ListViewData('United Artists Stonestown Twin', '501 Buckingham Way', Icons.theaters),
      ListViewData('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      ListViewData('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      ListViewData('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      ListViewData('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      ListViewData('La Ciccia', '291 30th St', Icons.restaurant),
    ];

    ListTile _buildListItem2(BuildContext buildContext, int index) => ListTile(
      title: Text(
        _listDatas[index].title,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20
        ),
      ),
      subtitle: Text(_listDatas[index].subTitle),
      leading: Icon(_listDatas[index].iconData, color: Colors.blue[500],),
    );

    Widget _buildList2() => ListView.builder(
      itemCount: _listDatas.length,
      itemBuilder: _buildListItem2,
    );
    return Scaffold(
        appBar: AppBar(title: Text(title),),
        body: Container(
          padding: EdgeInsets.all(10),
            child: _buildList2(),
        ),
    );
  }
}