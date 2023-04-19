import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Laura es más guapa que Juan',
      'answers': [
        {'text': 'Lára er sætari en Juan', 'score': 10},
        {'text': 'Lára er jafn sæt og Juan', 'score': 0},
        {'text': 'Lára er sætust', 'score': 0},
        {'text': 'Lára er sæt', 'score': 0}
      ],
    },
    {
      'questionText': 'Juan es el mejor',
      'answers': [
        {'text': 'Juan er verstur', 'score': 0},
        {'text': 'Juan er yngstur', 'score': 0},
        {'text': 'Juan er bestur', 'score': 10},
        {'text': 'Juan er verri', 'score': 0}
      ],
    },
    {
      'questionText': 'María es tan inteligente como Laura',
      'answers': [
        {'text': 'María er gáfaðari en Laura', 'score': 0},
        {'text': 'María er gáfuðust', 'score': 0},
        {'text': 'María er jafn gáfuð og Laura', 'score': 10},
        {'text': 'Laura er gáfaðari en María', 'score': 0}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Hay más preguntas!');
    } else {
      print('No hay más preguntas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Gradación de adjetivos'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
