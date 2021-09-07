import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

// ignore: non_constant_identifier_names
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Quiz({this.answerQuestion, this.questions, this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}

class required {}
