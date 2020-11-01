import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Dice Roller',
            style: GoogleFonts.antic(),
          ),
          backgroundColor: Colors.amberAccent,
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
  int leftDice = _getRandomNumber();
  int rightDice = _getRandomNumber();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            leftDice = _getRandomNumber();
          });
        },
        child: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        leftDice = _getRandomNumber();
                        rightDice = _getRandomNumber();
                      });
                    },
                    child: Image(
                      //width: MediaQuery.of(context).size.width / 2
                      image: AssetImage('images/dice${leftDice}.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        leftDice = _getRandomNumber();
                        rightDice = _getRandomNumber();
                      });
                    },
                    child: Image(
                      //width: MediaQuery.of(context).size.width / 2
                      image: AssetImage('images/dice${rightDice}.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static int _getRandomNumber() {
    var rng = new Random();
    int randomNum = rng.nextInt(5) + 1;

    return randomNum;
  }
}
