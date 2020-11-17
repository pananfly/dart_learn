

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Widget 2',
    home: Sample3Widget(),
  ));
}

Widget getSimpleWidget() {
  return Center(
    child: Text(
      "Hello, pananfly!",
      textDirection: TextDirection.ltr,
    ),
  );
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              "Example title",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded( // Expanded 扩展其他widget未使用的空间，如有多个expend则使用flex设置占用比例
            child: Center(
              child: Text('Hello, pananfly!'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {

  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(child: title,),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),

    );
  }
}

class Sample2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
        title: Text("Widget sample 2"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Text("Hello pananfly!"),
      ),
    );
  }
}

class Sample3Widget extends StatefulWidget {

  final List<Product> products = <Product>[];

  Sample3Widget({Key key}) : super(key: key) {
    products.add(Product(name: 'Eggs'));
    products.add(Product(name: 'Flour'));
    products.add(Product(name: 'Chocolate chips'));
    products.add(Product(name: 'Apple'));
    products.add(Product(name: 'Banana'));
    products.add(Product(name: 'lemon'));
    products.add(Product(name: 'cherry'));
    products.add(Product(name: 'peach'));
    products.add(Product(name: 'pear'));
    products.add(Product(name: 'pineapple'));
    products.add(Product(name: 'watermelon'));
  }

  @override
  State<StatefulWidget> createState() {
    return Sample3State();
  }
}

class Sample3State extends State<Sample3Widget> {

  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if(!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChangedCallback: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class Product {
  final String name;
  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChangedCallback;

  ShoppingListItem({this.product, this.inCart, this.onCartChangedCallback})
      : super(key: ObjectKey(product));

  Color _getColor(BuildContext ctx) {
    return inCart ? Colors.black54 : Theme.of(ctx).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext ctx) {
    if(!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChangedCallback(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}