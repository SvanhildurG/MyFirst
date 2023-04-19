import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 30) {
      resultText = 'Muy bien!';
    } else if (resultScore >= 20) {
      resultText = 'Casi casi!';
    } else if (resultScore >= 10) {
      resultText = 'Otra vez!';
    } else {
      resultText = 'Intenta de nuevo!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text('Juega de nuevo!'),
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: resetHandler,
        ),
      ]),
    );
  }
}
