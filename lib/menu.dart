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
                child: Text('Count: $count'),
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

            ),
          );
        }),
      ),
    );
  }
}