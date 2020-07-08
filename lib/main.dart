import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_provider_test/menu.dart';
import 'package:bloc_provider_test/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bloc>(
        create: (_) => Bloc(),
        child: MaterialApp(
          title: 'BLoC Provider Test',
          theme: ThemeData(
          ),
          home: Menu(title: 'BLoC Provider'),
        ));
  }
}
