import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_provider_test/bloc.dart';
import 'package:bloc_provider_test/cart.dart';


class Menu extends StatefulWidget {
  Menu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Bloc>(context);
    int count = 0;
    if(bloc.cart.length > 0) {
      count = bloc.cart.values.reduce((a,b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('Count: $count',
                    style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return GestureDetector(
            onTap: () {
              bloc.addItemToCart(index);
            },
            child: Container(
              child: Text('Item: $index'),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://api.time.com/wp-content/uploads/2020/04/Boss-Turns-Into-Potato.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }),
      ),
    );
  }
}