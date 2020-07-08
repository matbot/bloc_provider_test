import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_provider_test/bloc.dart';

class Cart extends StatelessWidget {
  Cart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Bloc>(context);
    var cart = bloc.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          int itemIndex = cart.keys.toList()[index];
          int count = cart[itemIndex];
          return ListTile(
            title: Text('Item: $itemIndex'),
            subtitle: Text('Count: $count'),
            trailing: RaisedButton(
              child: Text('Clear'),
              color: Theme.of(context).buttonColor,
              elevation: 2.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                bloc.removeItemFromCart(itemIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
