import 'package:fl01_lite/db/database.dart';
import 'package:fl01_lite/screens/ex0/ex0.dart';
import 'package:fl01_lite/screens/ex1/ex1.dart';
import 'package:fl01_lite/screens/ex2/ex2.dart';
import 'package:flutter/material.dart';

late MyDatabase database;

void main() {
  database = MyDatabase();
  runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ex2(),
    );
  }
}
