import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultLine {
    var resultText = 'You are sorted';
    if (resultScore <= 6) {
      resultText = 'Congratulations!! you are sorted in Hufflepuff';
    } else if (resultScore > 6 && resultScore <= 10) {
      resultText = 'You are sorted into Ravenclaw!!! ';
    } else if (resultScore > 10 && resultScore <= 14) {
      resultText = 'You belong to Gryfinndor!!! ';
    } else {
      resultText = 'Congratulations ,you are a Slytherin!!! ';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultLine,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Attemp Quiz again'),
            color: Colors.amber.shade600,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
