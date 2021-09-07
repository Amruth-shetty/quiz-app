import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultphase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likable';
    } else if (resultScore <= 16) {
      resultText = 'You are Strange?...';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultphase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Reset quiz'),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    ));
  }
}
