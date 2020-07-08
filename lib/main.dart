import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_provider_test/cart.dart';
import 'package:bloc_provider_test/bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bloc> (
      builder: (context) => Bloc(),
      child: MaterialApp(
        title: 'BLoC Provider Test',
        theme: ThemeData(
    primarySwatch: Colors.black,
      ),
    home: MyHomePage(title: 'BLoC Provider'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<Bloc>(context);
    int count = 0;
    if(bloc.cart.length > 0) {
      count = bloc.cart.values.reduce((a,b) => a + b);
    }
    return Scaffold(
    );
  }
}
