import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what is your fav color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'questionText': 'what is your fav Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'what is your fav Subject?',
      'answers': [
        {'text': 'Java', 'score': 1},
        {'text': 'python', 'score': 5},
        {'text': 'C', 'score': 3},
        {'text': 'C++', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;
  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalscore = 0;
  }

  void _answerQuestion(int score) {
    _totalscore = _totalscore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  Widget build(BuildContext context) {
    //questions = []; This doent work if the questions is const...It works only if u replace const with var
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            // RaisedButton(
            //   child:Text('Answer 1'),
            //   onPressed: _answerQuestion,
            // ),
            // RaisedButton(
            //   child: Text('Answer 2'),
            //   onPressed: () => print('Answer 2 chosen!'),
            // ),
            // RaisedButton(
            //     child: Text('Answer 3'),
            //     onPressed: () {
            //       print("Anser 3 chose!");
            //     }),
            //
            //
            //
            // Answer(_answerQuestion),
            // Answer(_answerQuestion),
            // Answer(_answerQuestion),

            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
