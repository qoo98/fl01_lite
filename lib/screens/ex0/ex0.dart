import 'dart:math';

import 'package:flutter/material.dart';

class ex0 extends StatefulWidget {

  @override
  _ex0State createState() => _ex0State();
}

class _ex0State extends State<ex0> {
  List<String> _result = [
    '大吉',
    '中吉',
    '吉',
    '大凶',
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    int resultNum = random.nextInt(4);

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/images/akamaru.png"),
                Text(_result[resultNum], style: TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none
                ),)
              ],
            ),
            SizedBox(height: 20),
            TextButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white
                ),
                onPressed: () => setState(() {}),
                child: Text("あなたの運勢は？", style: TextStyle(
                  fontSize: 20,
                color: Colors.blue
            ),
            ))

          ],
        ),
      ),
    );
  }
}
