import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sensors/sensors.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdice = 6;
  int rightdice = 3;

  @override
  Widget build(BuildContext context) {
    void Rollme() {
      setState(() {
        rightdice = Random().nextInt(6) + 1;
        leftdice = Random().nextInt(6) + 1;
      });
    }

    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        Rollme();
                      });
                    },
                    child: Image(
                      image: AssetImage('images/dice$leftdice.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        Rollme();
                      });
                    },
                    child: Image.asset(
                      'images/dice$rightdice.png',
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
                color: Colors.white,
                child: Text(
                  'Roll',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  gyroscopeEvents.listen((GyroscopeEvent event) {
                    if (event.y > 1) {
                      setState(() {
                        Rollme();
                      });
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
