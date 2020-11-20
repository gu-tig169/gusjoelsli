import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import './TodoObject.dart';
import 'TodoListView.dart';

void main() {
  var state = MyState();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter Demo',
     theme : ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity),
     home: TodoListView(),
    );
  }
}