import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ex1 extends StatefulWidget {

  @override
  _ex1State createState() => _ex1State();
}

class _ex1State extends State<ex1> {
  String _time = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), _onTimer);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カウントダウンタイマー"),
      ),
      body: Text(_time, style: TextStyle(
        fontSize: 60,
      ),),
    );
  }

  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var dateFormat = DateFormat('HH:mm:ss');
    var timeString = dateFormat.format(now);
    setState(() {
      _time = timeString;
    });
  }
}
